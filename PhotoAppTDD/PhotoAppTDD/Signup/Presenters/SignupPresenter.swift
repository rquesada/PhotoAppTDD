//
//  SignupPresenter.swift
//  PhotoAppTDD
//
//  Created by Roy Quesada on 22/5/23.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init (formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator  = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel){
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: SignupError.invalidFirstName)
            return 
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName){
            delegate?.errorHandler(error: SignupError.invalidLastName)
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email){
            delegate?.errorHandler(error: SignupError.invalidEmail)
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password){
            delegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }
        
        if !formModelValidator.doPasswordMatch(password: formModel.password, repeatPassword:
                                                formModel.repeatPassword){
            delegate?.errorHandler(error: SignupError.passwordDoNotMatch)
            return
        }
        
        let requestModel = SignupFormResquestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: requestModel) { [weak self] responseModel, error in

            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responseModel {
                self?.delegate?.successfullSignup()
                return 
            }
        }
    }
}
