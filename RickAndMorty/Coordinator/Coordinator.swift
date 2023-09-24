//
//  Cordinator.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 29/06/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var rootViewController: UIViewController { get }
    func presentViewController(viewController: UIViewController)
    func pushViewController(viewController: UIViewController)
}

final class NavControllerCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    weak var coordinator: DefaultTabControllerCoordinator?
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    init(navigationController: UINavigationController, coordinator: DefaultTabControllerCoordinator?) {
        self.navigationController = navigationController
        self.coordinator = coordinator
    }
    
    func presentViewController(viewController: UIViewController) {
        navigationController.present(viewController, animated: true)
    }
    
    func pushViewController(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}

final class DefaultTabControllerCoordinator {
    
    private let tabBarController: UITabBarController
    private var charactersCoordinator: Coordinator?
    private var locationsCoordinator: Coordinator?
    private var episodesCoordinator: Coordinator?
    
    init(tabBarController: UITabBarController = UITabBarController()) {
        self.tabBarController = tabBarController
        setupTabBar()
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
        
        let entityEpisode = RMEntity<RMEpisode, RMEpisodeConfiguration>(configuration: RMEpisodeConfiguration())
        let episodeDataProvider = RMDataProvider<RMEpisode, RMEpisodeConfiguration>(entity: entityEpisode)
        let episodeViewModel = RMListViewModel<RMEpisode, RMEpisodeConfiguration>(dataProvider: episodeDataProvider)
        let episodesViewController = RMListViewController(viewModel: episodeViewModel)
        
        charactersCoordinator = getCoordinator(for: charactersViewController,
                                               title: NSLocalizedString("Characters", comment: ""),
                                               image: UIImage(systemName: "person.circle.fill"))
        locationsCoordinator = getCoordinator(for: locationsViewController,
                                              title: NSLocalizedString("Locations", comment: ""),
                                              image: UIImage(systemName: "location.fill"))
        episodesCoordinator = getCoordinator(for: episodesViewController,
                                             title: NSLocalizedString("Episodes", comment: ""),
                                             image: UIImage(systemName: "tv.fill"))
        
        guard let charactersCoordinator, let locationsCoordinator, let episodesCoordinator else {
            return
        }
        
        tabBarController.viewControllers = [
            charactersCoordinator.rootViewController,
            locationsCoordinator.rootViewController,
            episodesCoordinator.rootViewController
        ]
    }
    
    func getRootViewController() -> UIViewController {
        tabBarController
    }
    
    private func getCoordinator<A,B>(for rootViewController: RMListViewController<A,B>, title: String, image: UIImage?) -> Coordinator {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        let navCoordinator = NavControllerCoordinator(navigationController: navController,
                                                      coordinator: self)
        rootViewController.navBarCoordinator = navCoordinator
        return navCoordinator
    }
    
    private func setupTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemBackground
        tabBarController.tabBar.tintColor = .systemGreen
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
