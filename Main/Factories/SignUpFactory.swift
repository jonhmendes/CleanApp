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
import Data
import Infra

class SignUpFactory {
    static func makeController() -> SignUpViewController {
        let controller = SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "httos://clean-node-api.herokuapp.com/api/signup")!
        let remoteAddAccount = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let presenter = SignUpPresenter(alertView: controller, emailValidator: emailValidatorAdapter, addAccount: remoteAddAccount, loadingView: controller)
        controller.signUp = presenter.signUp
        return controller
        
    }
}
