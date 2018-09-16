//
//  Alert.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    class func showAlert(text: String, vc: UIViewController) {
        let alert = UIAlertController(title: "Oops!", message: text, preferredStyle: .alert)
        let okAct = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAct)
        vc.present(alert, animated: true, completion: nil)
    }
}
