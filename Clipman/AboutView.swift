//
//  AboutView.swift
//  Clipman
//
//  Created by Julius Hell on 18.03.24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Clipman").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("by Julius Hell").font(.subheadline)
            Link("Repo", destination: URL(string: "https://github.com/erfgypO/Clipman")!)
        }
        .padding()
    }
}

#Preview {
    AboutView()
}
