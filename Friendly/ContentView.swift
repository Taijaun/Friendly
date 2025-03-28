//
//  ContentView.swift
//  Friendly
//
//  Created by Taijaun Pitt on 28/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        VStack {
            List(users, id: \.id){ user in
                VStack(alignment: .leading) {
                    Text(user.name)
                    
                    Text(user.company)
                }
            }
        }
        .onAppear(perform: {
            print("Hello")
        })
        .task {
            await getUsers(from: "https://www.hackingwithswift.com/samples/friendface.json")
        }
    }
    
    func getUsers(from url: String) async {
        
        guard let url = URL(string: url) else {
            print("No data in response")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
            
        } catch {
            print("Decoding error:", error)
        }
        
    }
}

#Preview {
    ContentView()
//    //
//    users: [
//        User(id: "1", isActive: true, name: "Bob", age:18, Company: "Google", email: "googledefault@gmail.com", address: "64 Zoo Lane", about: "I'm a fake google employee and I like cheese", registered: .distantPast, tags: [
//            "Cheese",
//            "Beans",
//            "Toast"
//        ], friends: [
//            Friend(id: "55", name: "George"),
//            Friend(id: "66", name: "Steve")
//        ])
//    ]
}
