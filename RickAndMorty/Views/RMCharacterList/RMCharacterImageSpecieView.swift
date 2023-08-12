//
//  RMCharacterImageSpecieView.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 11/08/23.
//

import Foundation
import UIKit

final class RMCharacterImageSpecieView: UIView {
    
    private var containerSpecieLabel = UIView()
    private var characterImage = UIImageView()
    private var specieContainer = UIView()
    private var specieLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        addSpecieContainer()
        addCharacterImage()
        addContainerSpecieLabel()
        addSpecieLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {
        specieLabel.text = ""
    }
    
    func setup(specie: String) {
        specieLabel.text = specie
    }
    
    func setupImage(url: URL?) {
        characterImage.setImage(with: url)
    }
    
    private func addSpecieContainer() {
        addSubview(specieContainer)
        specieContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            specieContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            specieContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            specieContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            specieContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    private func addCharacterImage(){
        specieContainer.addSubview(characterImage)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: specieContainer.topAnchor, constant: 0),
            characterImage.bottomAnchor.constraint(equalTo: specieContainer.bottomAnchor, constant: 0),
            characterImage.leadingAnchor.constraint(equalTo: specieContainer.leadingAnchor, constant: 0),
            characterImage.trailingAnchor.constraint(equalTo: specieContainer.trailingAnchor, constant: 0)
        ])
    }
    
    private func addContainerSpecieLabel() {
        specieContainer.addSubview(containerSpecieLabel)
        containerSpecieLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerSpecieLabel.bottomAnchor.constraint(equalTo: specieContainer.bottomAnchor, constant: 0),
            containerSpecieLabel.leadingAnchor.constraint(equalTo: specieContainer.leadingAnchor, constant: 0),
            containerSpecieLabel.trailingAnchor.constraint(equalTo: specieContainer.trailingAnchor, constant: 0),
        ])
        
        containerSpecieLabel.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func addSpecieLabel() {
        containerSpecieLabel.addSubview(specieLabel)
        specieLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            specieLabel.topAnchor.constraint(equalTo: containerSpecieLabel.topAnchor, constant: 0),
            specieLabel.bottomAnchor.constraint(equalTo: containerSpecieLabel.bottomAnchor, constant: 0),
            specieLabel.leadingAnchor.constraint(equalTo: containerSpecieLabel.leadingAnchor, constant: 0),
            specieLabel.trailingAnchor.constraint(equalTo: containerSpecieLabel.trailingAnchor, constant: 0)
        ])
        
        specieLabel.textColor = .white
        specieLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        specieLabel.textAlignment = .center
        specieLabel.numberOfLines = 0
    }
}


