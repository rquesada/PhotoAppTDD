//
//  SpyNavigationController.swift
//  TestingViewControllerNavigationTests
//
//  Created by Roy Quesada on 29/5/23.
//

import UIKit

class SpyNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }
}
