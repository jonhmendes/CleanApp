//
//  AlertView.swift
//  Presentation
//
//  Created by Jonathan Carvalho Mendes on 06/08/21.
//

import Foundation

public protocol AlertView {
    func showMessage(viewModel: AlertViewModel)
}

public struct AlertViewModel: Equatable {
    public var title: String?
    public var message: String?
    
    public init(title: String? = nil, message: String? = nil) {
        self.title = title
        self.message = message
    }
}
