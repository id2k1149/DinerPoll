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
    
    var dishes: [Dish] {
        getDishes()
    }
    
    var diners: [Diner] {
        getDiners()
    }
    
    private init() {}
}

extension DataStore {
    
    func getUsers(total max: Int) -> [User] {
        var users = [User]()
        
        for index in 1...max {
            users.append(User(name: "User\(index)", password: "pass"))
        }
        
        return users
    }
    
    func getDishes() -> [Dish] {
        var dishes = [Dish]()
        let max = Int.random(in: 3...5)
        
        for index in 1...max {
            dishes.append(Dish(dishName: "Dish #\(index)"))
        }
        
        return dishes
    }
    
    func getDiners() -> [Diner] {
        var diners = [Diner]()
        
        for index in 1...3 {
            diners.append(Diner(title: "Diner #\(index)", menu: getMenu()))
        }
        
        return diners
    }
    
    func getMenu() -> Menu {
        Menu(dishList: getMenuItems())
    }
    
    func getMenuItems() -> [MenuItem] {
        var list = [MenuItem]()
        
        return list
    }
    
    
    
}
