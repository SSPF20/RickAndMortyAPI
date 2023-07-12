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
        let characterEntity = RMEntity<RMCharacter, RMCharacterConfiguration>(configuration: RMCharacterConfiguration())
        let characterDataProvider = RMDataProvider<RMCharacter, RMCharacterConfiguration>(entity: characterEntity)
        let characterViewModel = RMListViewModel<RMCharacter, RMCharacterConfiguration>(dataProvider: characterDataProvider)
        let charactersViewController = RMListViewController(viewModel: characterViewModel)
        
        let locationEntity = RMEntity<RMLocation, RMLocationConfiguration>(configuration: RMLocationConfiguration())
        let locationDataProvider = RMDataProvider<RMLocation, RMLocationConfiguration>(entity: locationEntity)
        let locationViewModel = RMListViewModel<RMLocation, RMLocationConfiguration>(dataProvider: locationDataProvider)
        let locationsViewController = RMListViewController(viewModel: locationViewModel)
        
        let episodeEntity = RMEntity<RMEpisode, RMEpisodeConfiguration>(configuration: RMEpisodeConfiguration())
        let dataProviderEpisode = RMDataProvider<RMEpisode, RMEpisodeConfiguration>(entity: episodeEntity)
        let viewModelEpisode = RMListViewModel<RMEpisode, RMEpisodeConfiguration>(dataProvider: dataProviderEpisode)
        let episodesViewController = RMListViewController(viewModel: viewModelEpisode)
        
        tabBarController.viewControllers = [setNavigationController(for: charactersViewController,
                                                                    title: NSLocalizedString("Characters", comment: ""),
                                                                    image: UIImage(systemName: "person.circle.fill")),
                                            setNavigationController(for: locationsViewController,
                                                                    title: NSLocalizedString("Locations", comment: ""),
                                                                    image: UIImage(systemName: "location.fill")),setNavigationController(for: episodesViewController, title: "Episodes", image: UIImage(systemName: "multiply.circle.fill"))]
    }
    
    func getRootViewController() -> UIViewController {
        tabBarController
    }
    
    private func setNavigationController(for rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
