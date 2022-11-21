//
//  DataSource.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

class DataStore {
    static let shared = DataStore()
    
    var users: [User] {
        getUsers(total: Int.random(in: 3...5))
    }
    
    private init() {}
}

extension DataStore {
    
    func getDishes() -> [Dish] {
        var dishes = [Dish]()
        let max = Int.random(in: 3...5)
        
        for index in 1...max {
            dishes.append(Dish(dishName: "Dish + \(index)"))
        }
        
        return dishes
    }
    
    func getUsers(total max: Int) -> [User] {
        var users = [User]()
        
        for index in 1...max {
            users.append(User(name: "User\(index)", password: "pass"))
        }
        
        return users
    }
    
    
    
}
