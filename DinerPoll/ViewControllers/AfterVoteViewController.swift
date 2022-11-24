//
//  ViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/23/22.
//

import UIKit

class AfterVoteViewController: UIViewController {
    
    //MARK: @IBOutlet
    @IBOutlet var dinerLabels: [UILabel]!
    @IBOutlet var voteLabels: [UILabel]!
    
    //MARK: vars
    var voteResult: VoteResult!
    
    //MARK: override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        updateUI()
    }

}

// MARK: - Private Methods
extension AfterVoteViewController {
    
    private func updateUI() {
        
        for (label, diner) in zip(dinerLabels, voteResult.answers.keys) {
            label.text = "\(diner.name)"
        }
        
    }
}
