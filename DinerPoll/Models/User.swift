//
//  User.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

final class User {
    let name: String
    let password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
}

extension User {
    static func getUsers() -> [User] {

        var users = [User]()
        
        for index in 1...5 {
            users.append(User(name: "User\(index)", password: "pass"))
        }
        
        return users
    }
}
