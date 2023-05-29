//
//  SignupFormValidatorTests.swift
//  XCTAssertNoThrowTutorialTests
//
//  Created by Roy Quesada on 29/5/23.
//

import XCTest
@testable import XCTAssertNoThrowTutorial

final class SignupFormValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError(){
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act and Assert
        /*
         // First approach using XCTAssertThrowsError
         XCTAssertThrowsError(try sut.isFirstNameValid("Sergey*"), "The isFirstNameValid() should have thrown and error if user's first name contains illigal characters"){ errorThrow in
            XCTAssertEqual(errorThrow as? SignupError, SignupError.illigalCharactersFound)
            
        }*/
        
        // Second approach: Using do cathc
        do {
            let _ = try sut.isFirstNameValid("Sergey*")
            XCTFail("The isFirstNameValid() was supposed to throw an error when illigal characters used in User's first name")
        } catch SignupError.illigalCharactersFound {
            // Successfully passing
            return
        } catch {
            XCTFail("The isFirstNameValid() was supposed to throw the SignupError.illigalCharactersFound Error when illigal characters used. A different Error was thrown.")
            return
        }
        
    }
    
    func testFirstNameValidation_WhenValidCharactersProvided_ThrowsNoError(){
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act and Assert
        /*
         //First approach: Using XCTAssertNoThrow
        XCTAssertNoThrow(try sut.isFirstNameValid("Sergey"), "The isFirstNameValid() should not have throw an error when there are no illigal characters provided")
         
         */
        // Second approach: Using do catch
        do {
            let _ = try sut.isFirstNameValid("Sergey")
        } catch {
            XCTFail("The isFirstNameValid() was not supposed to throw an Error when a valid First Name value was provided")
        }
        
        
    }

}
