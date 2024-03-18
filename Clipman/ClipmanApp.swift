//
//  ClipmanApp.swift
//  Clipman
//
//  Created by Julius Hell on 17.03.24.
//

import SwiftUI

@main
struct ClipmanApp: App {
    @StateObject var watcher = PasteboardWatcher()

    var body: some Scene {
        MenuBarExtra("Clipman", systemImage: "doc.on.clipboard.fill") {
            MenuView().environmentObject(watcher)
        }
        
        Window("About Clipman", id: "about-window") {
            AboutView()
        }
    }
}
