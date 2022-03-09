//
//  Validation.swift
//  Authentification
//
//  Created by Компьютер on 17.02.2022.
//

import Foundation

class LoginHelper {
    
    static func isValidLogin(_ login: String) -> Bool {
        let loginRegEx = "^[A-Za-z0-9]{8,16}$"
        let loginpred = NSPredicate(format: "SELF MATCHES %@", loginRegEx)
        return loginpred.evaluate(with: login)
    }
}

class EmailHelper {
    
    static func isValidEmail(_ email: String) -> Bool {
        let loginRegEx = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[a-z]{2,64}$"
        let loginpred = NSPredicate(format: "SELF MATCHES %@", loginRegEx)
        return loginpred.evaluate(with: email)
    }
}

class PasswordHelper {
    
    static func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^[A-Za-z0-9 !$%&?._-]{8,16}$"
        let passwordpred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordpred.evaluate(with: password)
    }
}
