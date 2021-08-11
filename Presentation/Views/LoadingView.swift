//
//  LoadinView.swift
//  Presentation
//
//  Created by Jonathan Carvalho Mendes on 11/08/21.
//

import Foundation

public protocol LoadingView {
    func display(viewModel: LoadingViewModel)
}

public struct LoadingViewModel: Equatable {
    public var isLoading: Bool
    
    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }
}
