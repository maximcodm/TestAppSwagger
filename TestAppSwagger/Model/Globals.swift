//
//  Constants.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import Foundation

enum Constants {
    static let STORYBOARD_NAME = "Main.storybard"
    
    static let LOGIN_SB_ID = "login_id"
    static let SIGNUP_SB_ID = "signup_id"
    static let MAIN_SB_ID = "main_id"
    
    static let TO_SIGNUP_SEGUE_ID = "toSignup"
    
    static let CONTENT_CELL_ID = "content_cell"
    
    static let EMPTY_FIELDS_ERROR = "One or several fields are empty"
    static let INVALID_EMAIL_ERROR = "Email is invalid"
    static let SHORT_PASSWORD_ERROR = "Password should be at least 8 symbols"
    static let UNKNOWN_ERROR = "Something went wrong. Please try again later"
}

enum ErrorType: Error {
    case HasEmptyFields
    case InvalidEmail
    case ShortPassword
    case ShortName
    case EmptyUserObj
}

enum AuthType {
    case Login
    case Signup
}

struct Credentials {
    var name: String?
    var email: String
    var password: String
}

struct User {
    var name: String
    var email: String
    var token: String
}
