//
//  SignupViewDelegateProtocol.swift
//  PhotoAppTDD
//
//  Created by Roy Quesada on 22/5/23.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
