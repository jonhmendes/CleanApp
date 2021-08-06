//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Jonathan Carvalho Mendes on 06/08/21.
//

import Foundation

public final class SignUpPresenter {
    private let alertView: AlertView
    
    public init(alertView: AlertView) {
        self.alertView = alertView
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        }
    }
    
    private func validate(viewModel: SignUpViewModel) -> String? {
        if viewModel.name == nil || viewModel.name!.isEmpty {
            return "o campo Nome é obrigatório"
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            return "o campo E-mail é obrigatório"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "o campo Senha é obrigatório"
        } else if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            return "o campo Confirmar Senha é obrigatório"
        }
        return nil
    }
}

public struct SignUpViewModel {
    public var name: String?
    public var email: String?
    public var password :String?
    public var passwordConfirmation :String?
    
    public init(name: String? = nil, email: String? = nil, password :String? = nil, passwordConfirmation :String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
