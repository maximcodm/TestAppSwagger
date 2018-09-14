//
//  SignupViewController.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var nameEditText: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    
    @IBAction func backAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        signup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func signup() {
        
    }
    
    private func validateData() throws -> Credentials? {
        if let name = nameEditText.text, let email = emailTextField.text, let password = passwordEditText.text {
            if name.isEmpty && email.isEmpty && password.isEmpty {
                throw ErrorType.HasEmptyFields
            }
            if name.count < 4 {
                throw ErrorType.ShortName
            } else if !email.contains("@") {
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
