//
//  DataSource.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

class DataStore {
    static let shared = DataStore()
    
    var users: [User] {
        var users = [User]()
        let randomMax = Int.random(in: 3...5)
        
        for index in 1...randomMax {
            users.append(User(name: "User\(index)", password: "pass"))
        }
        return users
    }
    
    var diners: [Diner] {
        var diners = [Diner]()
        var randomNumbers = Array(1...100).shuffled()
        
        for _ in 1...9 {
            
            let dinerName = "Diner #\(randomNumbers[0])"
            randomNumbers.removeFirst()
            
            var dishList = [(String, String)]()
            let menuLength = Int.random(in: 2...4)
            
            for _ in 1...menuLength {
                let dishName = "Dish_\(randomNumbers[0])"
                randomNumbers.removeFirst()
                let dishPrice = "$\(Int.random(in: 1...20)).00"
                let menuItem = (dishName, dishPrice)
                dishList.append(menuItem)
            }
            
            let diner = Diner(name: dinerName, menu: dishList)
            diners.append(diner)
        }
        return diners
    }
    
    private init() {}
}
