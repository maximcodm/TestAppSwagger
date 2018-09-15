//
//  Parser.swift
//  TestAppSwagger
//
//  Created by Maxym on 15.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONParser {
    private var json: JSON? = nil
    
    init(data: Data) {
        json = JSON(data)
    }
    
    func getUser() -> User? {
        guard let json = json else { return nil }
        guard let success = json["success"].bool else { return nil }
        if success {
            let authJson = json["data"]
            guard let name = authJson["name"].string else { return nil }
            guard let email = authJson["email"].string else { return nil }
            guard let token = authJson["access_token"].string else { return nil }
            return User(name: name, email: email, token: token)
        }
        return nil
    }
    
    func getString() -> String? {
        guard let json = json else { return nil }
        guard let success = json["success"].bool else { return nil }
        if success {
            guard let string = json["data"].string else { return nil }
            return string
        }
        return nil
    }
}
