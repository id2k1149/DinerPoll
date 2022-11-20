//
//  User.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

struct User {
    let name: String
    let password: String
}

extension User {
    
    static func getUsers() -> [User] {
        DataStore.shared.users
    }
    
}
