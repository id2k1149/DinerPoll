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
        
        for index in 1...5 {
            users.append(User(name: "User\(index)", password: "pass"))
        }
        return users
    }
    
    var diners: [Diner] {
        var diners = [Diner]()
        let dinersNames = [
            "Chang-Fisher",
            "Sheppard-Tucker",
            "Faulkner-Howard",
            "Wagner",
            "Campos",
            "Handmade Graph",
            "Astonishing Studio",
            "Eclipse Rises",
            "Pane In The Glass",
            "Go Figure",
            "Mosaics",
            "Long Last Craft",
            "The Empty Plate",
            "The Agreeing Cart",
            "Poetic Craftiness Co",
            "Hipster",
            "The Trendy",
            "Jaguar Ventures",
            "The Dry Pagoda",
            "The Sleek Apple",
            "Chest Cheese",
            "The Fast Spoon",
            "Oceans Clean Up"
        ]
        var randomDiners = dinersNames.shuffled()
        
        let dishes = [
            "Oven-Baked Basil",
            "Lime Quail",
            "Broasted Saffron",
            "Shallot Turkey",
            "Poached Cucumber",
            "Lime Lollies",
            "Seared Chili Fish",
            "Cured Garlic",
            "Rosemary Spring Vegetables",
            "Baked Curry of Chestnuts",
            "Mandarin Ice",
            "Caramel",
            "Waffles",
            "Jelly",
            "Papaya Candy"
        ]
        
        for _ in 1...9 {
            
            let dinerName = "\(randomDiners[0])"
            randomDiners.removeFirst()
            
            var dishList = [String : String]()
            let menuLength = Int.random(in: 2...4)
            var randomDishes = dishes.shuffled()
            
            for _ in 1...menuLength {
                let dishName = "\(randomDishes[0])"
                randomDishes.removeFirst()
                let dishPrice = "$\(Int.random(in: 1...20)).00"
                dishList.updateValue(dishPrice, forKey: dishName)
            }
            
            let diner = Diner(name: dinerName, menu: dishList)
            diners.append(diner)
        }
        return diners
    }
    
    private init() {}
}
