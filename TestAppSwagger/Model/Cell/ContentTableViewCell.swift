//
//  ContentTableViewCell.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    func update(text: String) {
        mainLabel.text = text
    }

}
