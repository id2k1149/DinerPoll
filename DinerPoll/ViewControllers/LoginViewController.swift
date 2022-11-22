//
//  ViewController.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/17/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let users = User.getUsers()
    let diners = Diner.getDiners()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
    }
    
    //MARK: override functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let tabBarVC = navigationVC.topViewController as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let dinersVC = viewController as? DinersTableViewController {
                dinersVC.diners = diners
            } else if let pollVC = viewController as? PollViewController {
                pollVC.diners = diners
//                pollVC.view.backgroundColor = .systemOrange
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func loginButtonTapped() {
        
        for index in 0..<users.count {
            if users[index].name == userNameTF.text && users[index].password == passwordTF.text {
                performSegue(withIdentifier: "openPollVC", sender: nil)
            }
        }
        
        showAlert(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            textField: passwordTF
        )
    }
    
    @IBAction func unwindForLogout(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: UIAlertController
extension LoginViewController {
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
