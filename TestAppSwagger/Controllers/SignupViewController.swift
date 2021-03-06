//
//  SignupViewController.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var signupIndicator: UIActivityIndicatorView!
    @IBOutlet weak var buttonsStack: UIButton!
    
    @IBOutlet weak var nameEditText: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    
    @IBAction func backAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        signup()
        signupActions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func signup() {
        var creds: Credentials?
        do {
            creds = try validateData()
        } catch ErrorType.HasEmptyFields {
            Alert.showAlert(text: Constants.EMPTY_FIELDS_ERROR, vc: self)
            signupActions()
        } catch ErrorType.InvalidEmail {
            Alert.showAlert(text: Constants.INVALID_EMAIL_ERROR, vc: self)
            signupActions()
        } catch ErrorType.ShortPassword {
            Alert.showAlert(text: Constants.SHORT_PASSWORD_ERROR, vc: self)
            signupActions()
        } catch {
            Alert.showAlert(text: Constants.UNKNOWN_ERROR, vc: self)
            signupActions()
        }
        
        if let creds = creds {
            Client.instance.sendAuth(creds: creds, type: .Signup, handler: { (response) in
                if let error = response.error {
                    print(error.localizedDescription)
                }
                let success = self.parseData(data: response.data)
                if success {
                    DispatchQueue.main.async {
                        self.toMainScreen()
                    }
                } else {
                    DispatchQueue.main.async {
                        Alert.showAlert(text: Constants.CREDS_ARE_TAKEN, vc: self)
                        self.signupActions()
                    }
                }
            })
        }
    }
    
    private func parseData(data: Data) -> Bool {
        let parser = JSONParser(data: data)
        guard let user = parser.getUser() else {
            return false
        }
        Storage.instance.setUser(user: user)
        return true
    }
    
    private func toMainScreen() {
        guard let mainPage = self.storyboard?.instantiateViewController(withIdentifier: Constants.MAIN_SB_ID) as? MainViewController else { return }
        present(mainPage, animated: true, completion: nil)
        signupActions()
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
                return Credentials(name: name, email: email, password: password)
            }
        }
        return nil
    }
    
    private func signupActions() {
        buttonsStack.isHidden = !buttonsStack.isHidden
        signupIndicator.isHidden = !signupIndicator.isHidden
    }

}
