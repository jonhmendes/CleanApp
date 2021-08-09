//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Jonathan Carvalho Mendes on 27/07/21.
//

import XCTest
import Presentation

class SignUpPresenterTests: XCTestCase {
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
    func test_signUp_should_error_message_if_password_confirmation_not_match() {
        let (sut, alertViewSpy) = makeSut()
        
        let signUpViewModel = SignUpViewModel(name: "Jonahan", email: "any_password", password: "any_password", passwordConfirmation: "wrong_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Falha ao confirmar senha"))
    }
}

extension SignUpPresenterTests {
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

