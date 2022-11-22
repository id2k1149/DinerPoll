//
//  Vote.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/22/22.
//

import Foundation

class Vote {
    let date: Date
    let user: User
    let userChoice: Diner
    
    init(date: Date, user: User, userChoice: Diner) {
        self.date = date
        self.user = user
        self.userChoice = userChoice
    }
}
