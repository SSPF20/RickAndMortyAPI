//
//  RMHostingController.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 17/08/23.
//

import SwiftUI

final class RMHostingController<T: View>: UIHostingController<T> {
    
    init(view: T) {
        super.init(rootView: view)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
