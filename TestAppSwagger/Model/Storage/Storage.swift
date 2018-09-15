//
//  Storage.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import Foundation

class Storage {
    static let instance = Storage()
    private init() {}
    
    private var user: User!
    
    func setUser(user: User) {
        self.user = user
    }
    
    func getUser() throws -> User {
        guard let user = user else {
            throw ErrorType.EmptyUserObj
        }
        return user
    }
}
