//
//  UseCasesIntegrationTests.swift
//  UseCasesIntegrationTests
//
//  Created by Jonathan Carvalho Mendes on 27/07/21.
//

import XCTest
import Infra
import Domain
import Data

class AddAccountUseCasesIntegrationTests: XCTestCase {

    func test_add_account() {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "httos://clean-node-api.herokuapp.com/api/signup")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Jonathan Mendes", email: "jonathan.mendes89@gmail.com", password: "secret", passwordConfirmation: "secret")
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure(let error): XCTAssertEqual(error, .unexpected)
            case .success(let account):
                XCTAssertNotNil(account.id)
                XCTAssertEqual(account.name, addAccountModel.name)
                XCTAssertEqual(account.email, addAccountModel.email)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }

}
