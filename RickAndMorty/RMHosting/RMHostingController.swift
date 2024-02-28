//
//  RMHostingController.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 17/08/23.
//

import SwiftUI

protocol Router {
    func showDetail()
}

final class RMNavigationController: UINavigationController, Router {
    
    func showDetail() {
        
    }
}

final class RMHostingController<T: View>: UIHostingController<T> {
    
    init(entityDetailView: T) {
        super.init(rootView: entityDetailView)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
