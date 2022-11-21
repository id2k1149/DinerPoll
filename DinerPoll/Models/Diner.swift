//
//  Diner.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

final class Diner {
    let name: String
    let menu: [(String, String)]
    
    init(name: String, menu: [(String, String)]) {
        self.name = name
        self.menu = menu
    }
}

extension Diner {
    
    static func getDiners() -> [Diner] {
        DataStore.shared.diners
    }
    
}
