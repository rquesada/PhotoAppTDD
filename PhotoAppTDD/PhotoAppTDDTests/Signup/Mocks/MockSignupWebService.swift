//
//  MockSignupWebService.swift
//  PhotoAppTDDTests
//
//  Created by Roy Quesada on 22/5/23.
//

import Foundation
@testable import PhotoAppTDD

class MockSignupWebService: SignupWebServiceProtocol {
    var isSignupMethodCalled :Bool = false
    var shouldReturnError : Bool = false
    
    func signup(withForm formModel: SignupFormResquestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void){
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not sucessful"))
        }else{
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
}
