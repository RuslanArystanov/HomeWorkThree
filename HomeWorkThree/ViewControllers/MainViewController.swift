//
//  MainViewController.swift
//  HomeWorkThree
//
//  Created by Руслан Арыстанов on 03.10.2024.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var userNameTexField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var forgotUserNameButton: UIButton!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTexField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        
        passwordTextField.isSecureTextEntry = true
        
        userNameTexField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let viewControllers = tabBarController.viewControllers
        
        for viewController in viewControllers! {
            if let welcomeVC = viewController as? UserPajeViewController {
                welcomeVC.userName = user.person.name + " " + user.person.surname
                
            } else if let navigationController = viewController as? UINavigationController {
                let profilePage = navigationController.topViewController as? ProfilePageViewController
                
                profilePage?.tabBarName = user.person.name + " " + user.person.surname
                profilePage?.name = user.person.name
                profilePage?.surname = user.person.surname
                profilePage?.hobbie = user.person.hobbie
                profilePage?.placeOfWork = user.person.placeOfWork
                profilePage?.target = user.person.target
            }
        }
    }

    @IBAction func logIn() {
        if passwordTextField.text == user.password && userNameTexField.text == user.login{
            self.performSegue(withIdentifier: "welcomePage", sender: self)
        } else {
            showAlert(
                "Invalid login or password",
                "Please, enter correct login and password"
            )
            
            passwordTextField.text = nil
        }
    }
    
    @IBAction func promptUserInformation(_ sender: UIButton) {
        var promptMessage = ""
        
        switch sender {
        case forgotUserNameButton:
            promptMessage = "Your name is \(user.login) 😉"
        default:
            promptMessage = "Your password is \(user.password) 😉"
        }
        
        showAlert("Oops!", promptMessage)
    }
    
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTexField.text = nil
        passwordTextField.text = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTexField {
            passwordTextField.becomeFirstResponder()
        } else {
            logIn()
        }
        
        return true
    }
    
    
}


