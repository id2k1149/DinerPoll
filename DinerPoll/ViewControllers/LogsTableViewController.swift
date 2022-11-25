//
//  LogsTableViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/24/22.
//

import UIKit

class LogsTableViewController: UITableViewController {
    
//    var logsList = VoteLog.shared.logs

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        VoteLog.shared.logs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logsID", for: indexPath)
        let log = VoteLog.shared.logs[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(log.0) \(log.1) \(log.2)"
        cell.contentConfiguration = content
        return cell
    }

}
