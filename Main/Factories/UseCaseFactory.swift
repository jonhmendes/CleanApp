//
//  UseCaseFactory.swift
//  Main
//
//  Created by Jonathan Carvalho Mendes on 13/08/21.
//

import Foundation
import Data
import Infra
import Domain

class UseCaseFactory {
    static func makeRemoteAddAccount() -> AddAccount {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "httos://clean-node-api.herokuapp.com/api/signup")!
        return RemoteAddAccount(url: url, httpClient: alamofireAdapter)
    }
}
