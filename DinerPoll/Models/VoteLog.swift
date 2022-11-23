//
//  Vote.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/22/22.
//

import Foundation

// Singleton
class VoteLog {
    static var shared = VoteLog()
    
    var logs = [(Date, String, String)]()
    
    private init() {}
    
}
