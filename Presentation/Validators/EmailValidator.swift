//
//  EmailValidator.swift
//  Presentation
//
//  Created by Jonathan Carvalho Mendes on 09/08/21.
//

import Foundation

public protocol EmailValidator {
    func isValid(email: String) -> Bool
}
