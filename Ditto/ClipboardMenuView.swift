import SwiftUI
import AppKit
import Foundation

struct ClipboardMenuView: View {
    @ObservedObject var manager = ClipboardManager.shared

    var body: some View {
        VStack(spacing: 12) {
            header
            modeToggle
            pasteNextButton
            bufferView
            Divider()
            footer
        }
        .padding(12)
        .frame(width: 300)
        .overlay(
            PasteHUD(message: manager.hudMessage ?? "")
                .opacity(manager.hudMessage == nil ? 0 : 1)
        )
        .onChange(of: manager.hudMessage) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                manager.hudMessage = nil
            }
        }
    }

    // MARK: - Header

    var header: some View {
        HStack {
            Text("\u{1F4CB} ClipboardFlow")
                .font(.headline)
            Spacer()
            Text(manager.pasteMode.rawValue)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: - Mode Toggle

    var modeToggle: some View {
        Button(action: {
            manager.toggleMode()
        }) {
            HStack {
                Text("Mode:")
                Text(manager.pasteMode.rawValue)
                    .bold()
                Spacer()
                Image(systemName: "arrow.triangle.2.circlepath")
            }
        }
        .buttonStyle(BorderlessButtonStyle())
    }

    // MARK: - Paste Next

    var pasteNextButton: some View {
        Button("Paste Next") {
            manager.pasteNext()
        }
        .buttonStyle(BorderlessButtonStyle())
    }

    // MARK: - Buffer List

    var bufferView: some View {
        if manager.buffer.isEmpty {
            return AnyView(emptyBufferView)
        } else {
            let reversedBuffer = Array(manager.buffer.reversed())
            let displayBuffer: [ClipboardItem] = manager.pasteMode == .fifo ? reversedBuffer : manager.buffer
            let count = manager.buffer.count
            let current = manager.currentIndex % count

            return AnyView(
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(Array(displayBuffer.prefix(8).enumerated()), id: \ .element.id) { pair in
                            let index = pair.offset
                            let item = pair.element
                            let actualIndex = manager.pasteMode == .fifo ? count - 1 - index : index
                            let isNext = actualIndex == current

                            ClipboardItemView(index: index + 1, item: item, isNext: isNext)
                        }
                    }
                }
                .frame(height: 260)
            )
        }
    }

    var emptyBufferView: some View {
        VStack(spacing: 4) {
            Spacer()
            Text("The buffer is empty.")
                .foregroundColor(.secondary)
            Text("Copy something to start.")
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
        }
    }

    // MARK: - Footer

    var footer: some View {
        HStack {
            Button("Clear") {
                manager.clearBuffer()
            }
            Spacer()
            Button("Quit") {
                NSApp.terminate(nil)
            }
        }
        .padding(.bottom, 8)
    }
}

// MARK: - Clipboard Item Preview

struct ClipboardItemView: View {
    let index: Int
    let item: ClipboardItem
    let isNext: Bool

    var body: some View {
        HStack(spacing: 6) {
            Text("\(index).")
                .foregroundColor(.gray)

            if isNext {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.green)
            }

            switch item {
            case .text(let string, _):
                Text(String(string.prefix(40)))
                    .lineLimit(1)
                    .font(.callout)
                    .fontWeight(isNext ? .bold : .regular)
            case .image(let data, _):
                if let nsImage = NSImage(data: data) {
                    Image(nsImage: nsImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                } else {
                    Text("Image (error)")
                        .foregroundColor(.red)
                }
            }

            Spacer()
        }
    }
}
