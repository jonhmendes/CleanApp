//
//  MakeSignUpComposer.swift
//  Main
//
//  Created by Jonathan Carvalho Mendes on 13/08/21.
//

import Foundation
import Domain
import UI

public final class SignUpComposer {
    static func composeViewControllerWith(addAccount: AddAccount) -> SignUpViewController {
        return ControllerFactory.makeSignUp(addAccount: addAccount)
    }
}
