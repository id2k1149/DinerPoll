//
//  User.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

class User {
    let name: String
    let password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
}

extension User {
    
    static func getUsers() -> [User] {
        DataStore.shared.users
    }
    
}
