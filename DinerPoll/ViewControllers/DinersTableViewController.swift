//
//  DinersTableViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/21/22.
//

import UIKit

class DinersTableViewController: UITableViewController {
    
    var diners: [Diner]!
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        diners.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        diners[section].name
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        diners[section].menu.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dinerID", for: indexPath)

        let menu = diners[indexPath.section].menu
        
        var content = cell.defaultContentConfiguration()
        
        for i in 1...diners[indexPath.section].menu.count {
            if indexPath.item == i - 1 {
                content.text = "\(i). \(menu[indexPath.item].0) for \(menu[indexPath.item].1)"
            }
        }

        cell.contentConfiguration = content


        return cell
    }
     
     
}
