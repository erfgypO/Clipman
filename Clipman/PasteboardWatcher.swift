//
//  PasteboardWatcher.swift
//  Clipman
//
//  Created by Julius Hell on 17.03.24.
//

import Foundation
import SwiftUI

class PasteboardWatcher: ObservableObject {
    var timer: Timer?
    //var lastInput: String = ""
    @Published var history: [String] = []
    var pasteboard = NSPasteboard.general

    func clear() {
        pasteboard.clearContents()
        history = []
    }
    
    func copyToPasteboard(content: String) {
        pasteboard.clearContents()
        pasteboard.setString(content, forType: NSPasteboard.PasteboardType.string)
    }
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {_ in
            if let content = self.pasteboard.string(forType: .string) {
      
                let lastInput = self.history.first
                
                if content != lastInput {
                    var mutatedHistory = self.history
                    mutatedHistory.insert(content, at: 0)
                
                    if(mutatedHistory.count > 5) {
                        mutatedHistory = Array(mutatedHistory.prefix(upTo: 5))
                    }
                    
                    self.history = mutatedHistory
                    
                }
            }
        })
    }
    
    deinit {
        timer?.invalidate()
    }
}
