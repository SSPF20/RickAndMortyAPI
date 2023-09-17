//
//  RMCharacterHorizontalCell.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 12/06/23.
//

import UIKit

final class RMCharacterHorizontalCell: UICollectionViewCell, RMItemCell {
    
    private var container = UIView()
    private var characterImageSpecieView = RMCharacterImageSpecieView()
    private var nameLabel = UILabel()
    private var statusView = RMCharacterStatusView()
    private var lastLocationLabel = UILabel()
    private var locationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContainer()
        addCharacterImage()
        addNameLabel()
        addStatusView()
        addLocationLabel()
        addLastLocationLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        characterImageSpecieView.prepareForReuse()
        statusView.prepareForReuse()
        nameLabel.text = nil
        locationLabel.text = nil
    }
    
    func setup(viewModel: RMItemCellViewModel) {
        guard let viewModel = viewModel as? RMCharacterCellViewModel else {
            return
        }
        characterImageSpecieView.setupImage(url: viewModel.imageURL)
        characterImageSpecieView.setup(specie: viewModel.specie)
        statusView.setup(status: viewModel.status)
        nameLabel.text = viewModel.name
        locationLabel.text = viewModel.location
    }
    
    private func addContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        container.backgroundColor = .systemBackground
        container.layer.cornerRadius = 20
        container.layer.borderWidth = 1
    }
    
    private func addCharacterImage() {
        container.addSubview(characterImageSpecieView)
        characterImageSpecieView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImageSpecieView.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            characterImageSpecieView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            characterImageSpecieView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0),
            characterImageSpecieView.heightAnchor.constraint(equalToConstant: 150),
            characterImageSpecieView.widthAnchor.constraint(equalToConstant: 150)
        ])
        characterImageSpecieView.clipsToBounds = true
        characterImageSpecieView.layer.cornerRadius = 20
    }
    
    private func addNameLabel() {
        container.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageSpecieView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5)
        ])
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.numberOfLines = 0
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private func addStatusView() {
        container.addSubview(statusView)
        statusView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            statusView.leadingAnchor.constraint(equalTo: characterImageSpecieView.trailingAnchor, constant: 10),
        ])
        
        statusView.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private func addLastLocationLabel() {
        container.addSubview(lastLocationLabel)
        lastLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastLocationLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -5),
            lastLocationLabel.leadingAnchor.constraint(equalTo: characterImageSpecieView.trailingAnchor, constant: 10)
        ])
        
        lastLocationLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        lastLocationLabel.text = NSLocalizedString("Last Location: ", comment: "")
        lastLocationLabel.textColor = .systemGray3
        lastLocationLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private func addLocationLabel() {
        container.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5),
            locationLabel.leadingAnchor.constraint(equalTo: characterImageSpecieView.trailingAnchor, constant: 10),
            locationLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5)
        ])
        
        locationLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        locationLabel.numberOfLines = 0
        locationLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
}
