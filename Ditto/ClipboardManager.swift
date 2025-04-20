import Foundation
import AppKit
import Combine

class ClipboardManager: ObservableObject {
    static let shared = ClipboardManager()
    
    private var timer: Timer?
    private var lastChangeCount: Int = NSPasteboard.general.changeCount
    private var lastProgrammaticCopyTime: Date?
    
    @Published var buffer: [ClipboardItem] = []
    @Published var pasteMode: PasteMode = .fifo
    @Published var hudMessage: String?
    
    @Published var currentIndex = 0
    let maxBufferSize = 8
    
    private init() {
        startMonitoring()
    }
    
    // MARK: - Clipboard Monitoring
    
    func startMonitoring() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            let pb = NSPasteboard.general
            if pb.changeCount != self.lastChangeCount {
                self.lastChangeCount = pb.changeCount
                self.handleClipboardChange()
            }
        }
    }
    
    func handleClipboardChange() {
        // Avoid re-copying our own paste
        if let lastTime = lastProgrammaticCopyTime, Date().timeIntervalSince(lastTime) < 0.3 {
            print("🛑 Ignoring self-triggered clipboard change")
            return
        }
        
        let pb = NSPasteboard.general
        guard let types = pb.types else { return }
        
        if types.contains(.string), let string = pb.string(forType: .string) {
            addToBuffer(.text(string, UUID()))
        } else if types.contains(.png), let data = pb.data(forType: .png) {
            addToBuffer(.image(data, UUID()))
        }
    }
    
    func addToBuffer(_ item: ClipboardItem) {
        DispatchQueue.main.async {
            self.buffer.insert(item, at: 0)
            if self.buffer.count > self.maxBufferSize {
                self.buffer.removeLast()
            }
        }
    }
    
    func clearBuffer() {
        buffer.removeAll()
        currentIndex = 0
    }
    
    // MARK: - Paste Mode
    
    func toggleMode() {
        pasteMode = (pasteMode == .fifo) ? .lifo : .fifo
        currentIndex = 0
    }
    
    // MARK: - Paste Logic
    
    func pasteNext() {
        guard !buffer.isEmpty else {
            hudMessage = "📋 Buffer is empty"
            return
        }

        let item: ClipboardItem
        let indexToPaste: Int

        switch pasteMode {
        case .fifo:
            // Reverse the buffer to paste oldest first
            let reversed = Array(buffer.reversed())
            indexToPaste = currentIndex % reversed.count
            item = reversed[indexToPaste]
        case .lifo:
            indexToPaste = currentIndex % buffer.count
            item = buffer[indexToPaste]
        }

        currentIndex += 1
        setPasteboardToItem(item)
        simulatePaste()
        hudMessage = "📋 Pasted item \(indexToPaste + 1) of \(buffer.count)"
    }

    
    func pasteSlot(_ index: Int) {
        guard buffer.indices.contains(index) else {
            hudMessage = "❌ Slot \(index + 1) is empty"
            return
        }

        let item: ClipboardItem

        switch pasteMode {
        case .fifo:
            let reversed = Array(buffer.reversed())
            item = reversed[index]
        case .lifo:
            item = buffer[index]
        }

        setPasteboardToItem(item)
        simulatePaste()
        hudMessage = "📋 Pasted slot \(index + 1)"
    }

    
    // MARK: - Clipboard Setter
    
    private func setPasteboardToItem(_ item: ClipboardItem) {
        let pb = NSPasteboard.general
        pb.clearContents()
        lastProgrammaticCopyTime = Date()
        
        switch item {
        case .text(let string, _):
            pb.setString(string, forType: .string)
        case .image(let data, _):
            pb.setData(data, forType: .png)
        }
    }
    
    // MARK: - Simulated Paste
    
    private func simulatePaste() {
        // Hide our own app to give focus back to previous window
        NSApp.hide(nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            let src = CGEventSource(stateID: .combinedSessionState)
            
            let cmdDown = CGEvent(keyboardEventSource: src, virtualKey: 0x37, keyDown: true)
            let cmdUp = CGEvent(keyboardEventSource: src, virtualKey: 0x37, keyDown: false)
            let vDown = CGEvent(keyboardEventSource: src, virtualKey: 0x09, keyDown: true)
            let vUp = CGEvent(keyboardEventSource: src, virtualKey: 0x09, keyDown: false)
            
            vDown?.flags = .maskCommand
            vUp?.flags = .maskCommand
            
            let loc = CGEventTapLocation.cghidEventTap
            
            cmdDown?.post(tap: loc)
            vDown?.post(tap: loc)
            vUp?.post(tap: loc)
            cmdUp?.post(tap: loc)
            
            print("✅ Simulated ⌘V after 150ms delay")
        }
    }
}
