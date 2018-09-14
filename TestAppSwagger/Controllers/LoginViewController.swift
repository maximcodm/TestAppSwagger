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
        
//        var creds: Credentials?
//        
//        do {
//            creds = try validateData()
//        } catch ErrorType.HasEmptyFields {
//            Alert.showAlert(text: "Text", vc: self)
//        } catch ErrorType.InvalidEmail {
//            Alert.showAlert(text: "Text", vc: self)
//        } catch ErrorType.ShortPassword {
//            Alert.showAlert(text: "Text", vc: self)
//        } catch {
//            Alert.showAlert(text: "Text", vc: self)
//        }
//        
//        // make request
//        if let creds = creds {
//            Client.instance.send(cred: creds)
//        } else {
//            return
//        }
        
        // save token
//        Storage(token: "token")
        
        let mainPage = self.storyboard?.instantiateViewController(withIdentifier: Constants.MAIN_SB_ID) as? MainViewController
        present(mainPage!, animated: true, completion: nil)
    }
    
    private func signup(sender: UIButton) {
        performSegue(withIdentifier: Constants.TO_SIGNUP_SEGUE_ID, sender: sender)
    }
    
    private func validateData() throws -> Credentials? {
        return nil
    }

}

