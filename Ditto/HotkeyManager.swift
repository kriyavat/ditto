//
//  HotkeyManager.swift
//  ClipboardFlow
//
//  Created by Rahul on 30/03/25.
//

import Foundation
import HotKey

class HotkeyManager {
    static let shared = HotkeyManager()

    private var pasteNextHotKey: HotKey?
    private var slotHotKeys: [HotKey] = []

    private init() {
        registerHotkeys()
    }

    private func registerHotkeys() {
        // ⌘⌥V → Paste next
        pasteNextHotKey = HotKey(key: .v, modifiers: [.command, .option])
        pasteNextHotKey?.keyDownHandler = {
            print("🔥 ⌘⌥V pressed — PASTE NEXT")
            ClipboardManager.shared.pasteNext()
        }

        // ⌘⌥1 to ⌘⌥8 → Paste slot
        for i in 1...8 {
            if let key = Key(string: "\(i)") {
                let hotkey = HotKey(key: key, modifiers: [.command, .option])
                hotkey.keyDownHandler = {
                    print("🔥 ⌘⌥\(i) pressed — PASTE SLOT \(i)")
                    ClipboardManager.shared.pasteSlot(i - 1)
                }
                slotHotKeys.append(hotkey)
            }
        }
    }
}
