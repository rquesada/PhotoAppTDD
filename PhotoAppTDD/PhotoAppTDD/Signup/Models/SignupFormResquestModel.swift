//
//  SignupFormResquestModel.swift
//  PhotoAppTDD
//
//  Created by Roy Quesada on 17/5/23.
//

import Foundation

struct SignupFormResquestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
