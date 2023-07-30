//
//  RMCharacterHorizontalCell.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 12/06/23.
//

import UIKit

final class RMCharacterHorizontalCell: UICollectionViewCell, RMItemCell {
    
    private var container = UIView()
    private var characterImage = UIImageView()
    private var specieView = RMCharacterSpecieView()
    private var nameLabel = UILabel()
    private var statusView = RMCharacterStatusView()
    private var lastLocationLabel = UILabel()
    private var locationLabel = UILabel()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addContainer()
        addCharacterImage()
        addSpecieView()
        addNameLabel()
        addStatusView()
        addLocationLabel()
        addLastLocationLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        characterImage.image = UIImage(systemName: "square")
        specieView.prepareForReuse()
        statusView.prepareForReuse()
        nameLabel.text = nil
        locationLabel.text = nil
    }
    
    func setup(viewModel: RMItemCellViewModel) {
        guard let viewModel = viewModel as? RMCharacterCellViewModel else {
            return
        }
        
        characterImage.setImage(with: viewModel.imageURL)
        specieView.setup(specie: viewModel.specie)
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
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
        container.backgroundColor = .white
        container.layer.cornerRadius = 20
    }
    
    private func addCharacterImage() {
        container.addSubview(characterImage)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 11.0),
            characterImage.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -10),
            characterImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10.0),
            characterImage.widthAnchor.constraint(equalToConstant: 130),
            characterImage.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        characterImage.backgroundColor = .white
        characterImage.layer.borderWidth = 0.5
        characterImage.layer.borderColor = UIColor.black.cgColor
        characterImage.layer.cornerRadius = 20
        characterImage.clipsToBounds = true
    }
    
    private func addSpecieView() {
        characterImage.addSubview(specieView)
        specieView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            specieView.bottomAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 0),
            specieView.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor, constant: 0),
            specieView.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 0),
            specieView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
        
    private func addNameLabel() {
        container.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: characterImage.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 5.0),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -20.0)
        ])
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        nameLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private func addStatusView() {
        container.addSubview(statusView)
        statusView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4.0),
            statusView.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 5.0)
        ])
        statusView.setContentCompressionResistancePriority(.required, for: .vertical)
        statusView.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private func addLastLocationLabel() {
        container.addSubview(lastLocationLabel)
        lastLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastLocationLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 5.0),
            lastLocationLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 0),
            lastLocationLabel.topAnchor.constraint(greaterThanOrEqualTo: statusView.bottomAnchor, constant: 20.0),
            lastLocationLabel.heightAnchor.constraint(equalToConstant: 15)

        ])
        lastLocationLabel.text = "Last location:"
        lastLocationLabel.textColor = .lightGray
        lastLocationLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        lastLocationLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        lastLocationLabel.setContentHuggingPriority(.required, for: .vertical)

    }
    
    private func addLocationLabel() {
        container.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 5.0),
            locationLabel.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: container.trailingAnchor, multiplier: -20),
            locationLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
        ])
        
        locationLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        locationLabel.numberOfLines = 0
        locationLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        locationLabel.setContentHuggingPriority(.required, for: .vertical)
    }
}

#Preview ("RMCharacterHorizontalCell") {
    let origin = LocationBasic(id: 0, name: "Origin")
    let location = LocationBasic(id: 1, name: "Cualquiera")
    
    let character = RMCharacter(id: 0,
                                name: "Rick Sanchez test",
                                status: .alive,
                                species: "Unknown",
                                type: "",
                                gender: .male,
                                origin: origin,
                                location: location,
                                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                episode: [])
    
    let viewModel = RMCharacterCellViewModel(character: character)
    
    let frame = CGRect(x: 0, y: 0, width: 320, height: 200)
    let cell = RMCharacterHorizontalCell(frame: frame)
    
    cell.setup(viewModel: viewModel)
    return cell
}
