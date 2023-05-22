//
//  MockSignupViewDelegate.swift
//  PhotoAppTDDTests
//
//  Created by Roy Quesada on 22/5/23.
//

import Foundation
import XCTest
@testable import PhotoAppTDD

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation:XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: SignupError?
    
    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoAppTDD.SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
}
