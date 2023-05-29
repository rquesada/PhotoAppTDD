//
//  MockSingupPresenter.swift
//  PhotoAppTDDTests
//
//  Created by Roy Quesada on 29/5/23.
//

import Foundation
@testable import PhotoAppTDD

class MockSingupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: PhotoAppTDD.SignupModelValidatorProtocol, webService: PhotoAppTDD.SignupWebServiceProtocol, delegate: PhotoAppTDD.SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: PhotoAppTDD.SignupFormModel) {
        processUserSignupCalled = true
    }
}
