//
//  UITests.swift
//  UITests
//
//  Created by Jonathan Carvalho Mendes on 11/08/21.
//

import XCTest
import UIKit
import Presentation
@testable import UI

class SignUpViewControllerTest: XCTestCase {
    func test_loading_is_hidden_on_start() {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.loadingIndicator?.isAnimating, false)
    }
    
    func test_sut_implements_loadingView() {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        XCTAssertNotNil(sut as LoadingView)
    }
    
    func test_sut_implements_alertView() {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        XCTAssertNotNil(sut as AlertView)
    }
}