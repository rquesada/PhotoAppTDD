//
//  SignupWebService.swift
//  PhotoAppTDD
//
//  Created by Roy Quesada on 17/5/23.
//

import Foundation

class SignupWebService: SignupWebServiceProtocol {
    
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared){
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormResquestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void)
    {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            
            if let requestError = error {
                completionHandler(nil, SignupError.failedRequest(description: "A localized description of an error"))
                return
            }
            
            if let data = data, let signResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data){
                completionHandler(signResponseModel, nil)
            } else {
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
        dataTask.resume()
    }
    
}
