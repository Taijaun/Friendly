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
        Text(user.name)
    }
}

#Preview {
    UserDetail(user: User(id: "89345783234", isActive: true, name: "Bob", age: 37, company: "Google", email: "google123@gmail.com", address: "64 Zoo Lane", about: "I work at google", registered: "17/06/2004", tags: [
        "Hello",
        "Beans",
        "Toast"
    ], friends: [
        Friend(id: "55", name: "John")
    ]))
}
