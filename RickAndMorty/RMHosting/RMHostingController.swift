//
//  RMHostingController.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 17/08/23.
//

import SwiftUI

final class RMHostingController<T: View>: UIHostingController<T> {
    
    var rightBarButtonItem: UIBarButtonItem?
    
    init(view: T) {
        if let view = view as? NavigationBarHandler {
            rightBarButtonItem = view.getUIBarButtonItem()
        }
        super.init(rootView: view)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
