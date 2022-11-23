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
    var answerChoosen: String!
    var voteResult: VoteResult!
    var voteLog: VoteLog!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func radioButtonTapped(_ sender: UIButton) {
        
        radioButtons.forEach { button in
            guard let circle = UIImage(systemName: "circle") else { return }
            button.setImage(circle, for: .normal)
        }
        
        guard let buttonIndex = radioButtons.firstIndex(of: sender) else { return }
        answerChoosen = dinersForPoll[buttonIndex].name
        guard let circleFill = UIImage(systemName: "circle.fill") else { return }
        sender.setImage(circleFill, for: .normal)
    }
    
    @IBAction func VoteButtonTaped() {
        guard let currentVotes = voteResult.answers[answerChoosen] else  { return }
        voteResult.answers.updateValue(currentVotes + 1, forKey: answerChoosen)
        let logCount = voteLog.logs.count
        voteLog.logs[logCount - 1].0 = Date()
        voteLog.logs[logCount - 1].2 = answerChoosen
       
        print(voteResult.answers)
        voteLog.logs.forEach {log in
            print(log.0, log.1, log.2)
        }
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
                menuText += "\(dish.0) \n"
            }
            label.text = menuText
        }
        
        for (label, diner) in zip(priceCollection, dinersForPoll) {
            var price = ""
            for dish in diner.menu {
                price += "\(dish.1) \n"
            }
            label.text = price
        }
    }
    

    
    
}
