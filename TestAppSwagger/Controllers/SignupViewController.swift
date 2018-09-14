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

}
