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
    private var appUser: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        
    }
    
    //MARK: override functions
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let tabBarVC = segue.destination as? UITabBarController
//        else { return }
//
//        guard let viewControllers = tabBarVC.viewControllers
//        else { return }
//
//
//
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }


    @IBAction func loginButtonTapped() {
        
        for user in users {
            
            if user.name == userNameTF.text {
                appUser = user
                guard userNameTF.text == appUser.name, passwordTF.text == appUser.password else {
                    showAlert(
                        title: "Invalid login or password",
                        message: "Please, enter correct login and password",
                        textField: passwordTF
                    )
                    return
                }
                performSegue(withIdentifier: "openPollVC", sender: nil)
            } else {
                showAlert(
                    title: "Invalid login or password",
                    message: "Please, enter correct login and password",
                    textField: passwordTF
                )
                return
            }
            
        }
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
