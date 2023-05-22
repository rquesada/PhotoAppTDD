//
//  SignupWebServiceProtocol.swift
//  PhotoAppTDD
//
//  Created by Roy Quesada on 22/5/23.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormResquestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void)
}
