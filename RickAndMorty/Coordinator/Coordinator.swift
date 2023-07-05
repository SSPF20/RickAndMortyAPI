//
//  Cordinator.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 29/06/23.
//

import UIKit

final class Coordinator {
    
    private let tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController = UITabBarController()) {
        self.tabBarController = tabBarController
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let entity = RMEntity<RMCharacter, RMCharacterConfiguration>(configuration: RMCharacterConfiguration())
        let dataProvider = RMDataProvider<RMCharacter, RMCharacterConfiguration>(entity: entity)
        let viewModel = RMListViewModel<RMCharacter, RMCharacterConfiguration>(dataProvider: dataProvider)
        let charactersViewController = RMListViewController(viewModel: viewModel)
        tabBarController.viewControllers = [charactersViewController]
    }
    
    func getRootViewController() -> UIViewController {
        tabBarController
    }
}
