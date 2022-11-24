//
//  PollViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

import UIKit

class PollViewController: UIViewController {
    
    // MARK: @IBOutlet
    @IBOutlet var questionStack: UIStackView!
    @IBOutlet var voteAgainStack: UIStackView!
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var dinersLabels: [UILabel]!
    @IBOutlet var menuCollection: [UILabel]!
    @IBOutlet var priceCollection: [UILabel]!
    
    @IBOutlet var radioButtons: [UIButton]!
    
    // MARK: privates
    private var answerChoosen: String!
    
    var diners: [Diner]!
    var dinersForPoll: [Diner]!
    var currentUser: User!
    var voteResult: VoteResult!
    var voteLog: VoteLog!

    // MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navController = segue.destination as? UINavigationController else { return }
        guard let tapBarVC = navController.topViewController as? UITabBarController else { return }
        guard let viewControllers = tapBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let dinersVC = viewController as? DinersTableViewController {
                dinersVC.diners = diners
            } else if let pollVC = viewController as? PollViewController {
                let currenLog = (Date(), currentUser.name, "N/A")
                voteLog.logs.append(currenLog)
                pollVC.currentUser = currentUser
                pollVC.diners = diners
                pollVC.dinersForPoll = dinersForPoll
                pollVC.voteResult = voteResult
                pollVC.voteLog = voteLog
            } else if let resultsVC = viewController as? ResultsViewController {
                resultsVC.voteResult = voteResult
            }
        }
    }
    
    // MARK: @IBAction
    @IBAction func radioButtonTapped(_ sender: UIButton) {
        
        radioButtons.forEach { button in
            guard let circle = UIImage(systemName: "circle") else { return }
            button.setImage(circle, for: .normal)
        }
        
        guard let buttonIndex = radioButtons.firstIndex(of: sender) else { return }
        answerChoosen = dinersForPoll[buttonIndex].name
        print(answerChoosen as Any)
        guard let circleFill = UIImage(systemName: "circle.fill") else { return }
        sender.setImage(circleFill, for: .normal)
    }
    
    @IBAction func VoteButtonTaped() {
        if answerChoosen == nil {
            showAlert(title: "What is your choice?", message: "Please vote for any diner")
            return
        }
        
        guard let currentVotes = voteResult.answers[answerChoosen] else  { return }
        voteResult.answers.updateValue(currentVotes + 1, forKey: answerChoosen)
        let logCount = voteLog.logs.count
        voteLog.logs[logCount - 1].0 = Date()
        voteLog.logs[logCount - 1].2 = answerChoosen
       
        print(voteResult.answers)
        voteLog.logs.forEach {log in
            print(log.0, log.1, log.2)
        }
        
        performSegue(withIdentifier: "resultsID", sender: nil)
        
    }
    
    
    @IBAction func NoButtonTapped() {
        performSegue(withIdentifier: "resultsID", sender: nil)
    }
    
}

// MARK: - Private Methods
extension PollViewController {
    
    private func updateUI() {
        radioButtons.forEach { button in
            guard let circle = UIImage(systemName: "circle") else { return }
            button.setImage(circle, for: .normal)
        }
        
        for stackView in [questionStack, voteAgainStack] {
            stackView?.isHidden = true
        }
        
        let sortedVoteLog = voteLog.logs.sorted {
            $0.0 > $1.0
        }
        
        sortedVoteLog.forEach {log in
            if log.1 == currentUser.name && log.2 != "N/A" {
                showVoteAgain()
            } else {
                showQuestion()
            }
        }
    }
    
    private func showVoteAgain() {
        questionStack.isHidden = true
        voteAgainStack.isHidden = false
    }
    
    private func showQuestion() {
        questionStack.isHidden = false
        voteAgainStack.isHidden = true
        
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
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
