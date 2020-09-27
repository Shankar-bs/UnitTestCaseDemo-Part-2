//
//  LoginModuleViewModel.swift
//  TestCasesDemoTests
//
//  Created by Shankar B S on 19/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation

//1
import XCTest
//2
@testable import TestCasesDemo

class LoginModuleViewModelTest: XCTestCase {
    //3 - Optional to override these methods most of the cases we will ommit these methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    //4
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Test cases
    //Each test case functions must begin with word "test"
    func testThatUserEntersValidUsernameAndPassword() {
        let loginViewModel = LoginModuleViewModel()
        let shouldLogin = loginViewModel.loginWith(userName: "abchfgfgg", password: "123qweqwe")
        XCTAssertTrue(shouldLogin)
    }
    
    func testThatUserEntersInvalidUsernameAndPassword() {
        let loginViewModel = LoginModuleViewModel()
        let shouldLogin = loginViewModel.loginWith(userName: "abd cs 645", password: "qw e qw e")
        XCTAssertFalse(shouldLogin)
    }
    
    func testThatUserEntersValidPasswordAndInvalidUserName() {
        let loginViewModel = LoginModuleViewModel()
        let shouldLogin = loginViewModel.loginWith(userName: "ab 1** qw9 ()", password: "123qweqwe")
        XCTAssertFalse(shouldLogin)
    }
    
    func testThatUserEntersInvalidPasswordAndValidUserName() {
        let loginViewModel = LoginModuleViewModel()
        let shouldLogin = loginViewModel.loginWith(userName: "abcbsdsdcscs", password: "qweq we")
        XCTAssertFalse(shouldLogin)
    }
    
    //Some critical test cases as you think of
    func testThatUserEnters_20_letters_username() {
        let loginViewModel = LoginModuleViewModel()
        let shouldLogin = loginViewModel.loginWith(userName: "abrntlodnstoltngvtms", password: "123qweqwe")
        XCTAssertFalse(shouldLogin)
    }
    
    func testThatUserEnters_4_lettersUsernameWithValidPassword() {
        //you to write this test case
    }
    
    func testThatUserEnters_20_lettersPasswordWithValidUserName() {
        //you to write this test case
    }
    
    func testThatUserEntersFullTextPasswordWithValidUserName() {
        //you to write this test case
    }

}
