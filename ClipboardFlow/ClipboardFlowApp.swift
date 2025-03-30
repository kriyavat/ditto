//
//  ClipboardFlowApp.swift
//  ClipboardFlow
//
//  Created by Rahul on 30/03/25.
//

import SwiftUI

@main
struct ClipboardFlowApp: App {
    init() {
        // Register hotkeys immediately
        _ = HotkeyManager.shared
    }

    var body: some Scene {
        MenuBarExtra {
            ClipboardMenuView()
        } label: {
            Label("ClipboardFlow", systemImage: "doc.on.clipboard")
        }
        .menuBarExtraStyle(.window)
    }
}
