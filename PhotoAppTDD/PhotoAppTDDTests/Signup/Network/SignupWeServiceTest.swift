//
//  SignupWeServiceTest.swift
//  PhotoAppTDDTests
//
//  Created by Roy Quesada on 17/5/23.
//

import XCTest
@testable import PhotoAppTDD

final class SignupWeServiceTest: XCTestCase {

    var sut:SignupWebService!
    var signFormRequestModel:SignupFormResquestModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)

        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signFormRequestModel = SignupFormResquestModel(firstName: "Sergey", lastName: "Kargopolov", email:"test@test.com", password: "12345678")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess(){
        
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        //Act
        sut.signup(withForm: signFormRequestModel){ signupResponseModel, error in
            
            //Assert
            //"{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status,"ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceiveDifferentJSONResponse_ErrorTookPlace(){
        // Arrange
        let jsonString = "{\"path\":\"users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        //Act
        sut.signup(withForm: signFormRequestModel){ signupResponseModel, error in
            
            //Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containg unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenEmptyURLStringProvided_ReturnError(){
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignupWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { signupResponseModel, error in
            //Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription(){
        // Arrange
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description:errorDescription)
        
        // Act
        sut.signup(withForm: signFormRequestModel) { signupResponseModel, error in
            //Assert
            XCTAssertEqual(error, SignupError.failedRequest(description:errorDescription), "The signup() method did not return an expected error for the Failed Request")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}
