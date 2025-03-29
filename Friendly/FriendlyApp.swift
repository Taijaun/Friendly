//
//  FriendlyApp.swift
//  Friendly
//
//  Created by Taijaun Pitt on 28/03/2025.
//

import SwiftUI
import SwiftData

@main
struct FriendlyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
