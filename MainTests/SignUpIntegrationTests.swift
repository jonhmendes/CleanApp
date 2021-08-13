//
//  SignUpIntegrationTests.swift
//  MainTests
//
//  Created by Jonathan Carvalho Mendes on 13/08/21.
//

import XCTest
import Main

class SignUpIntegrationTests: XCTestCase {

    func test_ui_presentation_integration() {
        let sut = SignUpComposer.composeViewControllerWith(addAccount: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }
}
