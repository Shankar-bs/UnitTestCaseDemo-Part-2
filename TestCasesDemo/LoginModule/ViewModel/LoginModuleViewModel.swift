//
//  LoginModuleViewModel.swift
//  TestCasesDemo
//
//  Created by Shankar B S on 19/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
class LoginModuleViewModel {
    private let userNameMaxLength = 15
    private let userNameMinLength  = 5
    
    private let passwordMaxLength = 10
    private let passwordMinLength = 5
    
    
    func loginWith(userName: String, password: String) -> Bool {
        if (isValidUserName(userName: userName) && isValidPassword(password: password)) {
            return true
        }
        return false
    }
        
    private func isValidUserName(userName: String) -> Bool {
        //logic to validate user name
        if userName.range(of: "[^a-zA-Z]", options: .regularExpression) == nil {
            return userName.count <= userNameMaxLength && userName.count >= userNameMinLength
        }
        return false
    }
    
    private func isValidPassword(password: String) -> Bool {
        //logic to validate password
        let isPasswordInGivenRange = password.count <= passwordMaxLength && password.count >= passwordMinLength
        return isPasswordInGivenRange && password.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}
