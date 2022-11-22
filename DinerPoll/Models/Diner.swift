//
//  Diner.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

import Foundation

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
    
    static func sortDiners(for diners: [Diner]) -> [Diner] {
        var result = [Diner]()
        var dinersPriceRange = [(Diner, Int)]()
        
        diners.forEach { diner in
            var dinerTotalPrice = 0
            for index in 0..<diner.menu.count {
                let dishPrice = Int(Float(diner.menu[index].1.components(separatedBy: "$")[1]) ?? 0)
                dinerTotalPrice += dishPrice
            }
            dinersPriceRange.append((diner, dinerTotalPrice))
        }
        
        let sortedDiners = dinersPriceRange.sorted {
            $0.1 < $1.1
        }
        
        sortedDiners.forEach {
            result.append($0.0)
        }
        
        return result
    }
    
    static func getThreeDinersInTheMiddle(for diners: [Diner]) -> [Diner]{
        var result = [Diner]()
        let indexInMiddle = diners.count / 2
        
        for index in (indexInMiddle - 1)...(indexInMiddle + 1) {
            result.append(diners[index])
        }
        
        return result
    }
    
}
