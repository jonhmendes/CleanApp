//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Jonathan Carvalho Mendes on 06/08/21.
//

import Foundation
import Domain

public final class SignUpPresenter {
    private let alertView: AlertView
    private let loadingView: LoadingView
    private let emailValidator: EmailValidator
    private let addAccount: AddAccount
    
    public init(alertView: AlertView, emailValidator: EmailValidator, addAccount: AddAccount, loadingView: LoadingView) {
        self.alertView = alertView
        self.emailValidator = emailValidator
        self.addAccount = addAccount
        self.loadingView = loadingView
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            loadingView.display(viewModel: LoadingViewModel(isLoading: true))
            addAccount.add(addAccountModel: SignUpMapper.toAddAccountModel(viewModel: viewModel)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure: self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes"))
                case .success: self.alertView.showMessage(viewModel: AlertViewModel(title: "Sucesso", message: "Conta Criada com sucesso."))
                }
                self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
            }
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
        } else if viewModel.password != viewModel.passwordConfirmation {
            return "o campo Confirmar Senha é inválido"
        } else if !emailValidator.isValid(email: viewModel.email!) {
            return "o campo Email é inválido"
        }
        return nil
    }
}
