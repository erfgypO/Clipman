//
//  MenuView.swift
//  Clipman
//
//  Created by Julius Hell on 18.03.24.
//

import SwiftUI
import LaunchAtLogin

struct MenuView: View {
    @EnvironmentObject var watcher: PasteboardWatcher
    @Environment(\.openWindow) private var openWindow
    
    func getKeyEquivalent(number: Int) -> KeyEquivalent {
        return KeyEquivalent(Character(UnicodeScalar(0x0030 + number)!))
    }
    
    var body: some View {
        ForEach(Array(watcher.history.enumerated()), id: \.offset) { item in
            Button(item.element) { }
        }
        Button("Clear"){
            watcher.clear()
        }
            .disabled(watcher.history.count == 0)
            .keyboardShortcut("c", modifiers: .option)
        Divider()
        Button("About Clipman") {
            openWindow(id: "about-window")
        }
        LaunchAtLogin.Toggle()
        Button("Quit") {
            NSApplication.shared.terminate(nil)
        }.keyboardShortcut("q")
    }
}
