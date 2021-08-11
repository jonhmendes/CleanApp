//
//  AlertViewSpy.swift
//  PresentationTests
//
//  Created by Jonathan Carvalho Mendes on 11/08/21.
//

import Foundation
import Presentation

class AlertViewSpy: AlertView {
    var emit: ((AlertViewModel) -> Void)?
    
    func observe(completion: @escaping (AlertViewModel) -> Void) {
        self.emit = completion
    }
    
    func showMessage(viewModel: AlertViewModel) {
        self.emit?(viewModel)
    }
}
