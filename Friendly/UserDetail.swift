//
//  UserDetail.swift
//  Friendly
//
//  Created by Taijaun Pitt on 28/03/2025.
//

import SwiftUI

struct UserDetail: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                
                Text(user.name)
                    .font(.largeTitle).bold()
                
                
                Text(user.about)
                    .frame(maxWidth: 300)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                VStack {
                    Text("Join Date:")
                    Text(formatRegisteredDate())
                        .font(.subheadline).bold()
                }
                
                Spacer()
                
                VStack {
                    Text("Friends")
                        .font(.subheadline).bold()
                    
                    ForEach(user.friends, id: \.id) { friend in
                        Text(friend.name)
                            .font(.footnote)
                    }
                }
            }
            .padding()
        }
    }
    
    func formatRegisteredDate() -> String {
        return user.registered.convertToDate().formatted(date: .abbreviated, time: .omitted)
    }
    

}

#Preview {
    UserDetail(user: User(id: "89345783234", isActive: true, name: "Bob", age: 37, company: "Google", email: "google123@gmail.com", address: "64 Zoo Lane", about: "I work at google", registered: "17/04/2004", tags: [
        "Hello",
        "Beans",
        "Toast"
    ], friends: [
        Friend(id: "55", name: "John")
    ]))
}

extension String {
    func convertToDate() -> Date {
        let isoFormatter = ISO8601DateFormatter()
        
        if let date = isoFormatter.date(from: self) {
            return date
        } else {
            return .now
        }
    }
}
