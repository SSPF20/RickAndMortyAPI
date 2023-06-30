//
//  RMCharactersViewController.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 10/06/23.
//

import UIKit

final class RMCharactersViewController: UIViewController {
    
    init(load: Bool = true) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
    }
}
