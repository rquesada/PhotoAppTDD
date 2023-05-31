//
//  SignupErrors.swift
//  PhotoAppTDD
//
//  Created by Roy Quesada on 17/5/23.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description:String)
    case invalidFirstName
    case invalidLastName
    case invalidEmail
    case invalidPassword
    case passwordDoNotMatch
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        default:
            return ""
        }
    }
}
