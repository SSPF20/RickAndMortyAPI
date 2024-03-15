//
//  Cordinator.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 29/06/23.
//

import UIKit

protocol NavigationBarHandler {
    func getUIBarButtonItem() -> UIBarButtonItem
}

protocol Coordinator: AnyObject {
    var rootViewController: UIViewController { get }
    func pushEntityDetail<T: Decodable>(entity: T)
}

final class NavControllerCoordinator: Coordinator {
    func pushEntityDetail<T>(entity: T) where T : Decodable {
        
        guard let character = entity as? RMCharacter else {
            return
        }
        
        pushCharacterDetail(character: character)
    }
    
    
    let navigationController: UINavigationController
    weak var coordinator: DefaultTabControllerCoordinator?
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    init(navigationController: UINavigationController, coordinator: DefaultTabControllerCoordinator?) {
        self.navigationController = navigationController
        self.coordinator = coordinator
    }
    
    func pushCharacterDetail(character: RMCharacter) {
        let view = RMCharacterDetailView(viewModel: .init(character: character))
        let viewController = RMHostingController(view: view)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushLocationDetail(location: RMLocation) {
        let view = RMLocationDetailView(viewModel: .init(location: location))
        let viewController = RMHostingController(view: view)
        navigationController.pushViewController(viewController, animated: true)
    }
}


final class DefaultTabControllerCoordinator {
    
    private let tabBarController: UITabBarController
    private var charactersCoordinator: Coordinator?
    private var locationsCoordinator: Coordinator?
    private var episodesCoordinator: Coordinator?
    private let window: UIWindow?
    
    init(tabBarController: UITabBarController = UITabBarController(), window: UIWindow?) {
        self.tabBarController = tabBarController
        self.window = window
        initialAnimation()
    }
    
    private func initialAnimation() {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            imageView.image = UIImage(named: "logorm")
            guard let window = window else { return }
            imageView.center = window.center
            window.addSubview(imageView)
            window.backgroundColor = .white
            
            UIView.animate(withDuration: 1) {
                let size = imageView.frame.width * 3.5
                let diffx = window.frame.width - size
                let diffy = window.frame.height - size
                print(window.frame.width, window.frame.height, diffx, diffy)
                imageView.frame = CGRect(
                    x: diffx/2,
                    y: diffy/2,
                    width: size,
                    height: size)
                imageView.alpha = 0
            } completion: { [weak self] done in
                if done {
                    self?.setupView()
                }
            }
        }
    
    private func setupView() {
            setupTabBar()
            setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        let locationEntity = RMEntity<RMLocation, RMLocationConfiguration>(configuration: RMLocationConfiguration())
        let locationDataProvider = RMDataProvider<RMLocation, RMLocationConfiguration>(entity: locationEntity)
        let locationListViewModel = EntityListViewModel<RMLocation, RMLocationConfiguration>(dataProvider: locationDataProvider)
        let locationView = RMLocationListView(viewModel: locationListViewModel)
        let locationViewController = RMHostingController(view: locationView)
        
        let entityEpisode = RMEntity<RMEpisode, RMEpisodeConfiguration>(configuration: RMEpisodeConfiguration())
        let episodeDataProvider = RMDataProvider<RMEpisode, RMEpisodeConfiguration>(entity: entityEpisode)
        let episodeViewModel = RMListViewModel<RMEpisode, RMEpisodeConfiguration>(dataProvider: episodeDataProvider)
        let episodesViewController = RMListViewController(viewModel: episodeViewModel)
        
        let characterEntity = RMEntity<RMCharacter, RMCharacterConfiguration>(configuration: RMCharacterConfiguration())
        let characterDataProvider = RMDataProvider<RMCharacter, RMCharacterConfiguration>(entity: characterEntity)
        let charactersListViewModel = EntityListViewModel<RMCharacter, RMCharacterConfiguration>(dataProvider: characterDataProvider)
        let charactersListView = RMCharacterListView(viewModel: charactersListViewModel)
        let charactersListViewController = RMHostingController(view: charactersListView)
        
        
        charactersCoordinator = getCoordinator(for: charactersListViewController, 
                                               title: NSLocalizedString("Characters", comment: ""),
                                               image: UIImage(systemName: "person"))
            
        locationsCoordinator = getCoordinator(for: locationViewController,
                                              title: NSLocalizedString("Locations", comment: ""),
                                              image: UIImage(systemName: "location.fill"))
        
        episodesCoordinator = getCoordinator(for: episodesViewController,
                                             title: NSLocalizedString("Episodes", comment: ""),
                                             image: UIImage(systemName: "tv.fill"))
        
        charactersListViewModel.coordinator = charactersCoordinator
        locationListViewModel.coordinator = locationsCoordinator
        
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
    
    private func getCoordinator<A>(for rootViewController: RMHostingController<A>, title: String, image: UIImage?) -> Coordinator {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.rightBarButtonItem = rootViewController.rightBarButtonItem
        rootViewController.navigationItem.title = title
        let navCoordinator = NavControllerCoordinator(navigationController: navController,
                                                      coordinator: self)
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
