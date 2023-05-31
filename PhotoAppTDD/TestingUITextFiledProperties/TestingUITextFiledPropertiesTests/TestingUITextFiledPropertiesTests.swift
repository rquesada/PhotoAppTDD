//
//  TestingUITextFiledPropertiesTests.swift
//  TestingUITextFiledPropertiesTests
//
//  Created by Roy Quesada on 29/5/23.
//

import XCTest
@testable import TestingUITextFiledProperties

final class TestingUITextFiledPropertiesTests: XCTestCase {

    var sut:SignupViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws{
        // Arrange
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextfield is not connected")
        XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email address UITextfield does not have an Email Address Content Type set")
        
    }

    func testEmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws{
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextfield is not connected")
        XCTAssertEqual(emailTextField.keyboardType, .emailAddress, "Email address UITextfield does not have an Email keyboard type set")
    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField() throws{
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "Password UITextField is not conected")
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password UITextField is not a Secure Text Entry")
        
    }
}
