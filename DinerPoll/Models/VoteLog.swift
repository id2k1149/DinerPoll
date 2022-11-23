//
//  Vote.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/22/22.
//

import Foundation

class VoteLog {
    
    var date = Date()
    var user: User
    var userChoice: Diner
    
    init(user: User, userChoice: Diner) {
        self.user = user
        self.userChoice = userChoice
    }
    
}
