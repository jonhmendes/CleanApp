//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Jonathan Carvalho Mendes on 27/07/21.
//

import XCTest

class SignUpPresenter {
    private let alertView: AlertView
    
    init(alertView: AlertView) {
        self.alertView = alertView
    }
    
    func signUp(viewModel: SignUpViewModel) {
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

protocol AlertView {
    func showMessage(viewModel: AlertViewModel)
}

struct AlertViewModel: Equatable {
    var title: String?
    var message: String?
}

struct SignUpViewModel {
    var name: String?
    var email: String?
    var password :String?
    var passwordConfirmation :String?
}

class SignUpPresentationTests: XCTestCase {
    func test_signUp_should_error_message_if_name_is_not_provided() {
        let (sut, alertViewSpy) = makeSut()
        
        let signUpViewModel = SignUpViewModel(email: "Jonahan.mendes89@gmail.com", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "o campo Nome é obrigatório"))
    }
    
    func test_signUp_should_error_message_if_email_is_not_provided() {
        let (sut, alertViewSpy) = makeSut()
        
        let signUpViewModel = SignUpViewModel(name: "Jonahan", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "o campo E-mail é obrigatório"))
    }
    
    func test_signUp_should_error_message_if_password_is_not_provided() {
        let (sut, alertViewSpy) = makeSut()
        
        let signUpViewModel = SignUpViewModel(name: "Jonahan", email: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "o campo Senha é obrigatório"))
    }
    
    func test_signUp_should_error_message_if_password_confirmation_is_not_provided() {
        let (sut, alertViewSpy) = makeSut()
        
        let signUpViewModel = SignUpViewModel(name: "Jonahan", email: "any_password", password: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "o campo Confirmar Senha é obrigatório"))
    }
}

extension SignUpPresentationTests {
    func makeSut() -> (sut: SignUpPresenter, alertViewSpy: AlertViewSpy) {
        let alertViewSpy = AlertViewSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy)

        return (sut, alertViewSpy)
    }
    
    class AlertViewSpy: AlertView {
        var viewModel = AlertViewModel()
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
}

