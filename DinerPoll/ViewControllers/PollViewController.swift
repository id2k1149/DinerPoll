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
            label.text = diner.name
        }
    }
    

    
    
}
