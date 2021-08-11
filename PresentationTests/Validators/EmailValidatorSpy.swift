//
//  EmailValidatorSpy.swift
//  PresentationTests
//
//  Created by Jonathan Carvalho Mendes on 11/08/21.
//

import Foundation
import Presentation

class EmailValidatorSpy: EmailValidator {
    var isValid = true
    var email: String?
    
    func isValid(email: String) -> Bool {
        self.email = email
        return isValid
    }
    
    func simulateInvalidEmail() {
        self.isValid = false
    }
}
