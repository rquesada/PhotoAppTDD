//
//  TestingViewControllerNavigationTests.swift
//  TestingViewControllerNavigationTests
//
//  Created by Roy Quesada on 29/5/23.
//

import XCTest
@testable import TestingViewControllerNavigation

final class TestingViewControllerNavigationTests: XCTestCase {
    
    var sut: FirstViewController!
    var navigationController: UINavigationController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testNextViewButton_WhenTapped_SecondViewControllerIsPushed(){
        
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SecondViewController
        }
        expectation(for: myPredicate, evaluatedWith: navigationController)
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 2)
    }
    
    func testNextViewButton_WhenTapped_SecondViewControllerIsPushed_V2(){
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        RunLoop.current.run(until: Date())
        
        guard let _ = navigationController.topViewController as? SecondViewController else {
            XCTFail()
            return
        }
    }
    
    func testNextViewButton_WhenTapped_SecondViewControllerIsPushed_V3(){
        let spyNavigationController = SpyNavigationController(rootViewController: sut)
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavigationController.pushedViewController as? SecondViewController else {
            XCTFail()
            return
        }
    }
}
