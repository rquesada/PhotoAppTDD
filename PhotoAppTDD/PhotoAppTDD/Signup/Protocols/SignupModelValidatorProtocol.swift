//
//  SignupModelValidatorProtocol.swift
//  PhotoAppTDD
//
//  Created by Roy Quesada on 22/5/23.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isValidEmailFormat(email:String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func doPasswordMatch(password: String, repeatPassword:String) -> Bool
}
