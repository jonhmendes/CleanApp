//
//  SignUpFactory.swift
//  Main
//
//  Created by Jonathan Carvalho Mendes on 13/08/21.
//

import Foundation
import UI
import Presentation
import Validation
import Domain

final class ControllerFactory {
    static func makeSignUp(addAccount: AddAccount) -> SignUpViewController {
        let controller = SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let presenter = SignUpPresenter(alertView: controller, emailValidator: emailValidatorAdapter, addAccount: addAccount, loadingView: controller)
        controller.signUp = presenter.signUp
        return controller
    }
}
