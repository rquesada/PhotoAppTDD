//
//  PhotoAppTDDUITests.swift
//  PhotoAppTDDUITests
//
//  Created by Roy Quesada on 30/5/23.
//

import XCTest

final class SignupFlowUITests: XCTestCase {

    private var app : XCUIApplication!
    private var firstName : XCUIElement!
    private var lastName : XCUIElement!
    private var email : XCUIElement!
    private var password : XCUIElement!
    private var repeatPassword : XCUIElement!
    private var signupButton : XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoad_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
                
        XCTAssertTrue(firstName.isEnabled, "First name UITextfield is not enable for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextfield is not enable for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextfield is not enable for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextfield is not enable for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextfield is not enable for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "The signup button is no enable for user interactions")
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentErrorAlertDialog() {
        
        // Arrange
        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("K")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup form was submitted")
    }
    
    func testViewController_WhenValidFormSubmitted_PresentSuccessAlertDialog() {
        
        // Arrange
        firstName.tap()
        firstName.typeText("Sergey")
        
        lastName.tap()
        lastName.typeText("Kargopolov")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("123456789")
        
        repeatPassword.tap()
        repeatPassword.typeText("123456789")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "An Success Alert dialog was not presented when valid signup form was submitted")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
