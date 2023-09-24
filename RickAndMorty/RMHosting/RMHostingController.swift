//
//  RMHostingController.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 17/08/23.
//

import SwiftUI

final class RMHostingController<T: View>: UIHostingController<T> {
    
    let navBarConfiguration: NavigationBarConfiguration
    
    init(navBarConfiguration: NavigationBarConfiguration = .default, entityDetailView: T) {
        self.navBarConfiguration = navBarConfiguration
        super.init(rootView: entityDetailView)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = navBarConfiguration.title
        navigationController?.navigationBar.prefersLargeTitles = navBarConfiguration.prefersLargeTitles
    }
}


struct NavigationBarConfiguration {
    
    let prefersLargeTitles: Bool
    let tintColor: UIColor
    let backIconSystemName: String
    let title: String
    
    static var `default`: NavigationBarConfiguration {
        NavigationBarConfiguration(prefersLargeTitles: false,
                                   tintColor: .label,
                                   backIconSystemName: "arrowshape.turn.up.backward.fill",
                                   title: "")
    }
}
