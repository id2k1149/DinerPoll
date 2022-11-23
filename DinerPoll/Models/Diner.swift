//
//  Diner.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

import Foundation

final class Diner {
    let name: String
    let menu: [String : String]
    
    init(name: String, menu: [String : String]) {
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
        var dinersPriceRange = [(Diner, Double)]()
        
        diners.forEach { diner in
            var dinerTotalPrice: Double = 0
            
            for eachPrice in diner.menu {
                guard let dishPrice = Double(eachPrice.value.components(separatedBy: "$")[1]) else { return }
                dinerTotalPrice += dishPrice
            }
        
            let middlePriceForDish = dinerTotalPrice / Double(diner.menu.count)
            dinersPriceRange.append((diner, middlePriceForDish))
        }
        
        let sortedDiners = dinersPriceRange.sorted {
            $0.1 < $1.1
        }
        
        sortedDiners.forEach { diner in
            result.append(diner.0)
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
