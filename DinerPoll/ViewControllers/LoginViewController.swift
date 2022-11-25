//
//  ViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/17/22.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: @IBOutlet
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    //MARK: privates
    private let users = User.getUsers()
    private let diners = Diner.getDiners()
    private var currentUser: User!
    private var dinersForPoll: [Diner]!
    private var voteResult = VoteResult.shared
    
    //MARK: override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 15
        setInitialData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navController = segue.destination as? UINavigationController else { return }
        guard let tapBarVC = navController.topViewController as? UITabBarController else { return }
        guard let viewControllers = tapBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            
            if let dinersVC = viewController as? DinersTableViewController {
                dinersVC.diners = diners
            } else if let pollVC = viewController as? PollViewController {
                pollVC.currentUser = currentUser
                pollVC.diners = diners
                pollVC.dinersForPoll = dinersForPoll
                pollVC.voteResult = voteResult
            } else if let resultsVC = viewController as? ResultsViewController {
                resultsVC.voteResult = voteResult
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    //MARK: @IBAction
    @IBAction func loginButtonTapped() {
        
        for index in 0..<users.count {
            if users[index].name == userNameTF.text && users[index].password == passwordTF.text {
                currentUser = User(name: users[index].name, password: users[index].password)
                performSegue(withIdentifier: "NavControllerID", sender: nil)
            }
        }
        
        showAlert(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            textField: passwordTF
        )
    }
    
    @IBAction func forgotButtonTapped() {
        showAlert(
            title: "Please try any of these:",
            message: "User1 ... User5 with \"pass\"",
            textField: passwordTF
        )
    }
    
    @IBAction func unwindForLogout(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Private Methods
extension LoginViewController {
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func setInitialData() {
        let sortedDiners = Diner.sortDiners(for: diners)
        dinersForPoll = Diner.getThreeDinersInTheMiddle(for: sortedDiners)
        dinersForPoll.forEach { diner in
            voteResult.answers.updateValue(0, forKey: diner.name)
        }
    }
}
