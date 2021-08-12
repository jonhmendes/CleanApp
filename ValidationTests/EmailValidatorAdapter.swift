//
//  ValidationTests.swift
//  ValidationTests
//
//  Created by Jonathan Carvalho Mendes on 12/08/21.
//

import XCTest
import Presentation


public final class EmailValidatorAdapter: EmailValidator {
    
    private let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    public func isValid(email: String) -> Bool {
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try! NSRegularExpression(pattern: emailPattern)
        return regex.firstMatch(in: email, options: [], range: range) != nil
    }
    
}

class EmailValidatorAdapterTests: XCTestCase {
    func test_invalid_emails() {
        let sut = EmailValidatorAdapter()
        XCTAssertFalse(sut.isValid(email: "rr"))
        XCTAssertFalse(sut.isValid(email: "rr@"))
        XCTAssertFalse(sut.isValid(email: "rr@rr."))
        XCTAssertFalse(sut.isValid(email: "@rr.com"))
        XCTAssertFalse(sut.isValid(email: ""))
    }

    func test_valid_emails() {
        let sut = EmailValidatorAdapter()
        XCTAssertTrue(sut.isValid(email: "jonathan@gmail.com"))
        XCTAssertTrue(sut.isValid(email: "jonathan@hotmail.com"))
    }
}
