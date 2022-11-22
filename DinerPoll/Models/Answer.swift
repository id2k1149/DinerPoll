//
//  Answer.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/21/22.
//

class Answer {
    let diner: Diner
    var numberOfVotes = 0
    
    init(title: String, diner: Diner) {
        self.diner = diner
    }
}
