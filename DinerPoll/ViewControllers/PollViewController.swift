//
//  PollViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

import UIKit

class PollViewController: UIViewController {
    
    // MARK: @IBOutlet
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var radioButtons: [UIButton]!
    @IBOutlet var dinersLabels: [UILabel]!
    @IBOutlet var menuCollection: [UILabel]!
    @IBOutlet var priceCollection: [UILabel]!
    
    var dinersForPoll: [Diner]!
    var currentUser: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
}

// MARK: - Private Methods
extension PollViewController {
    
    private func updateUI() {
        let question = Question.getQuestion(for: dinersForPoll)
        questionLabel.text = question.title
        
        for (label, diner) in zip(dinersLabels, dinersForPoll) {
            label.text = "\(diner.name)                   MENU:"
        }
        
        for (label, diner) in zip(menuCollection, dinersForPoll) {
            var menuText = ""
            for dish in diner.menu {
                print(dish)
                menuText += "\(dish.0) \n"
            }
            print("-----")
            print(menuText)
            print("-----")
            label.text = menuText
        }
        
        for (label, diner) in zip(priceCollection, dinersForPoll) {
            var price = ""
            for dish in diner.menu {
                print(dish)
                price += "\(dish.1) \n"
            }
            print("-----")
            print(price)
            print("-----")
            label.text = price
        }
    }
    

    
    
}
