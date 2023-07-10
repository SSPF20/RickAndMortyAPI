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
        let entityCharacter = RMEntity<RMCharacter, RMCharacterConfiguration>(configuration: RMCharacterConfiguration())
        let dataProviderCharacter = RMDataProvider<RMCharacter, RMCharacterConfiguration>(entity: entityCharacter)
        let viewModelCharacter = RMListViewModel<RMCharacter, RMCharacterConfiguration>(dataProvider: dataProviderCharacter)
        let charactersViewController = RMListViewController(viewModel: viewModelCharacter)
        
        let entityLocation = RMEntity<RMLocation, RMLocationConfiguration>(configuration: RMLocationConfiguration())
        let dataProviderLocation = RMDataProvider<RMLocation, RMLocationConfiguration>(entity: entityLocation)
        let viewModelLocation = RMListViewModel<RMLocation, RMLocationConfiguration>(dataProvider: dataProviderLocation)
        let locationsViewController = RMListViewController(viewModel: viewModelLocation)
        
        let entityEpisode = RMEntity<RMEpisode, RMEpisodeConfiguration>(configuration: RMEpisodeConfiguration())
        let dataProviderEpisode = RMDataProvider<RMEpisode, RMEpisodeConfiguration>(entity: entityEpisode)
        let viewModelEpisode = RMListViewModel<RMEpisode, RMEpisodeConfiguration>(dataProvider: dataProviderEpisode)
        let episodesViewController = RMListViewController(viewModel: viewModelEpisode)
        
        tabBarController.viewControllers = [setNavigationController(for: charactersViewController,
                                                                    title: NSLocalizedString("Characters", comment: ""),
                                                                    image: UIImage(systemName: "person.circle.fill")!),
                                            setNavigationController(for: locationsViewController,
                                                                    title: NSLocalizedString("Locations", comment: ""),
                                                                    image: UIImage(systemName: "location.fill")!),
                                            setNavigationController(for: episodesViewController, title: "Episodes", image: UIImage(systemName: "multiply.circle.fill")!)]
    }
    
    func getRootViewController() -> UIViewController {
        tabBarController
    }
    
    private func setNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
