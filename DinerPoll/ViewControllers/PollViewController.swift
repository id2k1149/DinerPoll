//
//  PollViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

import UIKit

class PollViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var radioButtons: [UIButton]!
    @IBOutlet var dinersLabels: [UILabel]!
    
    var dinersForPoll: [Diner]!
    var currentUser: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        questionLabel.text 
        
        dinersForPoll.forEach {diner in
            print(diner.name)
        }

        print("name = \(currentUser.name)")
    }
    
}
