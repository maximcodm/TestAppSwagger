//
//  Client.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import Foundation
import SwiftHTTP

typealias Completion = (Response) -> Void

class Client {
    
    private let accessPoint = "https://apiecho.cf/api/"
    
    static let instance = Client()
    private init() {}
    
    private var credentials: Credentials!
    
    func sendAuth(creds: Credentials, type: AuthType, handler: @escaping Completion) {
        credentials = creds
        switch(type) {
            case .Login:
                login(handler: handler)
            case .Signup:
                signup(handler: handler)
        }
    }
    
    private func login(handler: @escaping Completion) {
        let loginUrl = "login/"
        let params = ["email": credentials.email, "password": credentials.password]
        HTTP.POST(accessPoint + "\(loginUrl)", parameters: params, completionHandler: handler)
    }
    
    private func signup(handler: @escaping Completion) {
        let signupUrl = "signup/"
        let params = ["name": credentials.name, "email": credentials.email, "password": credentials.password]
        HTTP.POST(accessPoint + "\(signupUrl)", parameters: params, completionHandler: handler)
    }
    
    func getData(handler: @escaping Completion) {
        let dataUrl = "get/text/"
        var token: String
        do {
            let user = try Storage.instance.getUser()
            token = user.token
        } catch ErrorType.EmptyUserObj {
            return
        } catch {
            return
        }
        let headers = ["Authorization": "Bearer \(token)"]
        HTTP.GET(accessPoint + dataUrl, headers: headers, completionHandler: handler)
    }
}
