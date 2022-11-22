//
//  PollViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/20/22.
//

import UIKit

class PollViewController: UIViewController {
    
    var diners: [Diner]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let sortedDiners = Diner.sortDiners(for: diners)
        let dinerForPoll = Diner.getMiddleDiners(for: sortedDiners)
    }
    
}
