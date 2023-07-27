//
//  RMLocationHorizontalCell.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 29/06/23.
//

import Foundation
import UIKit

final class RMLocationHorizontalCell: UICollectionViewCell, RMItemCell {
    private let container = UIView()
    private let stackView = UIStackView()
    private let locationNameLabel = UILabel()
    private let locationTypeLabel = UILabel()
    private let locationDimensionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContainer()
        setupStackView()
        addLocationNameLabel()
        addLocationTypeLabel()
        addLocationDimensionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: RMItemCellViewModel) {
        guard let viewModel = viewModel as? RMLocationCellViewModel else {
            return
        }
        
        setupLabels(viewmodel: viewModel)
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
        
        container.layer.borderWidth = 1
        container.layer.cornerRadius = 20
        container.backgroundColor = .systemBackground
    }
    
    private func setupStackView() {
        container.addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10)
        ])
        
        stackView.spacing = 8
    }
    
    private func addLocationNameLabel() {
        stackView.addArrangedSubview(locationNameLabel)
        locationNameLabel.textAlignment = .left
        locationNameLabel.numberOfLines = 0
    }
    
    private func addLocationTypeLabel() {
        stackView.addArrangedSubview(locationTypeLabel)
        locationTypeLabel.textAlignment = .left
        locationTypeLabel.numberOfLines = 0
    }
    
    private func addLocationDimensionLabel() {
        stackView.addArrangedSubview(locationDimensionLabel)
        locationDimensionLabel.textAlignment = .left
        locationDimensionLabel.numberOfLines = 0
    }
    
    private func setupLabels(viewmodel: RMLocationCellViewModel) {
        locationNameLabel.attributedText = NSLocalizedString("Name", comment: "").attributedTitleValue(with: viewmodel.name)
        locationTypeLabel.attributedText = NSLocalizedString("Type", comment: "").attributedTitleValue(with: viewmodel.type)
        locationDimensionLabel.attributedText = NSLocalizedString("Dimension", comment: "").attributedTitleValue(with: viewmodel.dimension)
    }
    
    
}
//#Preview ("RMLocationHorizontalCell") {
//    RMLocationHorizontalCell()
//}

