//
//  RMLocationHorizontalCell.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 29/06/23.
//

import Foundation
import UIKit

final class RMLocationCellViewModel: RMItemCellViewModel {
    
    private let location: RMLocation
    
    var name: String {
        location.name
    }
    
    var type: String {
        location.type
    }
    
    var dimension: String {
        location.dimension
    }
    
    init(location: RMLocation) {
        self.location = location
        super.init(id: location.id)
    }
}

final class RMLocationHorizontalCell: UICollectionViewCell, RMItemCell {
    private let container = UIView()
    private let nameLabel = UILabel()
    private let locationNameLabel = UILabel()
    private let typeLabel = UILabel()
    private let locationTypeLabel = UILabel()
    private let dimensionLabel = UILabel()
    private let locationDimensionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContainer()
        addNameLabel()
        addLocationNameLabel()
        addtypeLabel()
        addLocationTypeLabel()
        addDimensionLabel()
        addLocationDimensionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: RMItemCellViewModel) {
        guard let viewModel = viewModel as? RMLocationCellViewModel else {
            return
        }
        locationNameLabel.text = viewModel.name
        locationTypeLabel.text = viewModel.type
        locationDimensionLabel.text = viewModel.dimension
    }
}

extension RMLocationHorizontalCell {
    private func addContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        container.layer.borderWidth = 2
        container.layer.cornerRadius = 10
        container.backgroundColor = .systemBackground
    }
    
    private func addNameLabel() {
        container.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10)
        ])
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.text = NSLocalizedString("Name:", comment: "")
        nameLabel.textColor = .black
    }
    
    private func addLocationNameLabel() {
        container.addSubview(locationNameLabel)
        locationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationNameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            locationNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
        ])
        
        locationNameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationNameLabel.text = NSLocalizedString("Earth", comment: "")
        locationNameLabel.textColor = .black
        locationNameLabel.numberOfLines = 0
    }
    
    private func addtypeLabel() {
        container.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            typeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
        ])
        
        typeLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        typeLabel.text = NSLocalizedString("Type:", comment: "")
        typeLabel.textColor = .black
    }
    
    private func addLocationTypeLabel() {
        container.addSubview(locationTypeLabel)
        locationTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationTypeLabel.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor, constant: 10),
            locationTypeLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 8),
        ])
        
        locationTypeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationTypeLabel.text = NSLocalizedString("Planet", comment: "")
        locationTypeLabel.textColor = .black
        locationTypeLabel.numberOfLines = 0
    }
    
    private func addDimensionLabel() {
        container.addSubview(dimensionLabel)
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimensionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            dimensionLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            dimensionLabel.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -20)
        ])
        
        dimensionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        dimensionLabel.text = NSLocalizedString("Dimension:", comment: "")
        dimensionLabel.textColor = .black
        dimensionLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    private func addLocationDimensionLabel() {
        container.addSubview(locationDimensionLabel)
        locationDimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationDimensionLabel.topAnchor.constraint(equalTo: locationTypeLabel.bottomAnchor, constant: 10),
            locationDimensionLabel.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -20),
            locationDimensionLabel.leadingAnchor.constraint(equalTo: dimensionLabel.trailingAnchor, constant: 8),
            locationDimensionLabel.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: container.trailingAnchor, multiplier: -20)
        ])
        
        locationDimensionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationDimensionLabel.text = NSLocalizedString("Dimension C-137", comment: "")
        locationDimensionLabel.textColor = .black
        locationDimensionLabel.numberOfLines = 0
        locationDimensionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    
}
#Preview ("RMLocationHorizontalCell") {
    RMLocationHorizontalCell()
}

