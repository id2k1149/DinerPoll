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
    var winer: String {
        let answersSorted = answers.sorted {
            return $0.value > $1.value
        }
        return answersSorted[0].key
    }
    
    private init() {}
}
