//
//  SignUpFactories.swift
//  CleanApp
//
//  Created by Jonathan Carvalho Mendes on 16/11/21.
//

import Foundation
import UI

class SignUpFactory {
    static func makeController() -> SignUpViewController {
        return SignUpViewController.instantiate()
    }
}
