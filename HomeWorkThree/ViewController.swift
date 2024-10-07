//
//  ViewController.swift
//  HomeWorkThree
//
//  Created by Руслан Арыстанов on 03.10.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userNameTexField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var forgotUserNameButton: UIButton!
    
    private let userLogin = "Ruslan"
    private let userPassword = "Rusal"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTexField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userPage = segue.destination as? UserPajeViewController else {
            return
        }
        
        userPage.userName = userNameTexField.text
    }

    @IBAction func logIn() {
        if passwordTextField.text == userPassword && userNameTexField.text == userLogin{
            self.performSegue(withIdentifier: "welcomePage", sender: self)
        } else {
            showAlert(
                "Invalid login or password",
                "Please, enter correct login and password"
            )
        }
    }
    
    @IBAction func promptUserInformation(_ sender: UIButton) {
        var promptMessage = ""
        
        switch sender {
        case forgotUserNameButton:
            promptMessage = "Your name is \(userLogin) 😉"
        default:
            promptMessage = "Your password is \(userPassword) 😉"
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
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTexField.text = nil
        passwordTextField.text = nil
    }
    
}


