//
//  ViewController.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginAction(_ sender: UIButton) {
        login()
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        signup(sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func login() {
        
        var creds: Credentials?
        
        do {
            creds = try validateData()
        } catch ErrorType.HasEmptyFields {
            Alert.showAlert(text: Constants.EMPTY_FIELDS_ERROR, vc: self)
        } catch ErrorType.InvalidEmail {
            Alert.showAlert(text: Constants.INVALID_EMAIL_ERROR, vc: self)
        } catch ErrorType.ShortPassword {
            Alert.showAlert(text: Constants.SHORT_PASSWORD_ERROR, vc: self)
        } catch {
            Alert.showAlert(text: Constants.UNKNOWN_ERROR, vc: self)
        }
        
        // make request
        if let creds = creds {
            Client.instance.send(cred: creds)
        } else {
            return
        }
        
        // save token
//        Storage(token: "token")
        
        let mainPage = self.storyboard?.instantiateViewController(withIdentifier: Constants.MAIN_SB_ID) as? MainViewController
        present(mainPage!, animated: true, completion: nil)
    }
    
    private func signup(sender: UIButton) {
        performSegue(withIdentifier: Constants.TO_SIGNUP_SEGUE_ID, sender: sender)
    }
    
    private func validateData() throws -> Credentials? {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email.isEmpty && password.isEmpty {
                throw ErrorType.HasEmptyFields
            }
            if !email.contains("@") {
                throw ErrorType.InvalidEmail
            } else if password.count < 8 {
                throw ErrorType.ShortPassword
            } else {
                return Credentials(name: nil, email: email, password: password)
            }
        }
        return nil
    }

}

