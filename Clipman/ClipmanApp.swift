//
//  ClipmanApp.swift
//  Clipman
//
//  Created by Julius Hell on 17.03.24.
//

import SwiftUI
import LaunchAtLogin

func getKeyEquivalent(number: Int) -> KeyEquivalent {
    return KeyEquivalent(Character(UnicodeScalar(0x0030 + number)!))
}


@main
struct ClipmanApp: App {
    @StateObject var watcher = PasteboardWatcher()
    
    var body: some Scene {
        MenuBarExtra("Test", systemImage: "doc.on.clipboard.fill") {
            ForEach(Array(watcher.history.enumerated()), id: \.offset) { item in
                Button(item.element) {
                    watcher.copyToPasteboard(content: item.element)
                }.keyboardShortcut(getKeyEquivalent(number: item.offset + 1))
            }
            Divider()
            Button("Clear"){
                watcher.clear()
            }
            .disabled(watcher.history.count == 0)
                .keyboardShortcut("c", modifiers: .option)
            LaunchAtLogin.Toggle()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
    }
}
