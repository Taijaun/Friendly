//
//  ContentView.swift
//  Friendly
//
//  Created by Taijaun Pitt on 28/03/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var users: [User]
    
    var body: some View {
        NavigationStack{
            VStack {
                List(users, id: \.id){ user in
                    NavigationLink{
                        UserDetail(user: user)
                    } label: {
                        VStack(alignment: .center){
                            Text(user.name)
                            
                            Text(user.company)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .task {
                if users.isEmpty {
                    await getUsers(from: "https://www.hackingwithswift.com/samples/friendface.json")
                    print("loading users")
                }
                
            }
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
                saveToSwiftData(decodedResponse)
            }
            
        } catch {
            print("Decoding error:", error)
        }
        
    }
    
    func saveToSwiftData(_ users: [User]) {
        for user in users {
            modelContext.insert(user)
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
