//
//  ContentView.swift
//  Friendly
//
//  Created by Taijaun Pitt on 28/03/2025.
//

import SwiftUI

struct ContentView: View {
    var users = [User]()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView(users: [
        User(id: "1", isActive: true, name: "Bob", age:18, Company: "Google", email: "googledefault@gmail.com", address: "64 Zoo Lane", about: "I'm a fake google employee and I like cheese", registered: .distantPast, tags: [
            "Cheese",
            "Beans",
            "Toast"
        ], friends: [
            Friend(id: "55", name: "George"),
            Friend(id: "66", name: "Steve")
        ])
    ])
}
