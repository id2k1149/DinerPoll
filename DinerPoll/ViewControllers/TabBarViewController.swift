//
//  TabBarViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/21/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let diners = Diner.getDiners()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dinerListVC = viewControllers?[1] as? DinersTableViewController else { return }
        
        dinerListVC.diners = diners

    }

}
