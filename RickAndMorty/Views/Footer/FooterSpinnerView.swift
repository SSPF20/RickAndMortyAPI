//
//  FooterViewCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 2/08/23.
//

import UIKit

final class FooterSpinnerView: UICollectionReusableView {
    
    static let identifier = "FooterView"
    
    private let spinner = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSpinnerlayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Initializer coder has been initialized")
    }
    
    private func addSpinnerlayout() {
        
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        spinner.hidesWhenStopped = true
    }
    
    func toggleSpinner(isUpdating: Bool) {
        if isUpdating {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
}
