//
//  EmailValidatorAdapter.swift
//  Validation
//
//  Created by Jonathan Carvalho Mendes on 12/08/21.
//

import Foundation
import Presentation

public final class EmailValidatorAdapter: EmailValidator {
    
    private let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    public func isValid(email: String) -> Bool {
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try! NSRegularExpression(pattern: emailPattern)
        return regex.firstMatch(in: email, options: [], range: range) != nil
    }
    
    public init() {}
    
}
