//
//  Menu.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

final class MenuItem {
    let dish: Dish
    var price: Double
    
    init(dish: Dish, price: Double) {
        self.dish = dish
        self.price = price
    }
}
