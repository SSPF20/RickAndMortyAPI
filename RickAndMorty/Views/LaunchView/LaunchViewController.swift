//
//  LaunchViewController.swift
//  RickAndMorty
//
//  Created by Manuel Alejandro on 10/09/23.
//

import UIKit

class LaunchViewController: UIViewController {
    
    private let imageLogo: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        imageView.image = UIImage(named: "rmLogo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageLogo)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageLogo.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            self?.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            let size = (self?.view.frame.width ?? 300) * 3
            let diffx = size - (self?.view.frame.width ?? 300)
            let diffy = (self?.view.frame.height ?? 300) - size
            
            self?.imageLogo.frame = CGRect(
                x: -(diffx/2),
                y: diffy/2,
                width: size,
                height: size
            )
            self?.imageLogo.alpha = 0
        }) { [weak self] done in
            if done {
                let viewController = Coordinator().getRootViewController()
                viewController.modalTransitionStyle = .crossDissolve
                self?.present(viewController, animated: true)
            }
        }
        
    }
}
