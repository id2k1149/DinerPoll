//
//  Dish.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

final class Dish {
    let dishName: String
    
    init(dishName: String) {
        self.dishName = dishName
    }
}

extension Dish {
    
    func getDishList() -> [Dish] {
        let dishList = DataStore.shared.getDishes()
        dishList.forEach {
            print($0)
        }
        return dishList
    }
    
}
