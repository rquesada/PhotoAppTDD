//
//  SignupPresenterProtocol.swift
//  PhotoAppTDD
//
//  Created by Roy Quesada on 29/5/23.
//

import Foundation

protocol SignupPresenterProtocol : AnyObject {
    init (formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
