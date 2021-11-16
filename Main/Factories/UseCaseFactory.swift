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

public class UseCaseFactory {
    private static let  = AlamofireAdapter()
    private static let apiBaseUrl = Enviroment.variable(.apiBaseUrl)
    
    private static func makeUrl(path: String) -> URL {
        return URL(string: "\(apiBaseUrl)/\(path)")!
    }

    public static func makeRemoteAddAccount() -> AddAccount {
        return RemoteAddAccount(url: makeUrl(path:"signup"), httpClient: httpClient)
    }
}
