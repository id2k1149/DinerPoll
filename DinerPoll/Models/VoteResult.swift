//
//  VoteResult.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/23/22.
//

import Foundation

// Singleton
class VoteResult {
    static var shared = VoteResult()
    
    var answers = [String : Int]()
    var winner: String {
        let answersSorted = answers.sorted {
            return $0.value > $1.value
        }
        
        let maxVotes = answersSorted[0].value
        let winnerName = answersSorted[0].key
        
        for diner in answersSorted {
            if diner.value < maxVotes {
                continue
            } else if diner.key == winnerName {
                continue
            } else {
                return "No winner"
            }
        }
        return answersSorted[0].key
    }
    
    private init() {}
}
