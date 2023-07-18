//
//  RMEpisodeHorizontalCell.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 11/07/23.
//

import Foundation
import UIKit

final class RMEpisodeHorizontalCell: UICollectionViewCell, RMItemCell {
    
    private var container: UIView = UIView(frame: .zero)
    private var episodeNameLabel = UILabel()
    private let episodeAirDateLabel = UILabel()
    private let episodeCreatedLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addContainerView()
        addConstrainsNameLabel()
        addConstrainsCreatedLabel()
        addConstrainsAirDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Asignación de viewModel
    func setup(viewModel: RMItemCellViewModel) {
        
        guard let viewModel = viewModel as? RMEpisodeCellViewModel else { return }
        
        setupLabels(viewModel: viewModel)

    }
    
    override func prepareForReuse() {
        episodeNameLabel.attributedText = NSAttributedString("")
        episodeAirDateLabel.attributedText = NSAttributedString("")
        episodeCreatedLabel.attributedText = NSAttributedString("")
    }
    
}

//MARK: -Views
extension RMEpisodeHorizontalCell {
    
    private func addContainerView() {
        
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        container.layer.borderWidth = 2
        container.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        container.layer.cornerRadius = 20
        container.backgroundColor = .white

    }
    
    private func addConstrainsNameLabel() {
        
        container.addSubview(episodeNameLabel)
        
        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episodeNameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            episodeNameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            episodeNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: container.trailingAnchor)
            
        ])
        
    }
    
    private func addConstrainsCreatedLabel() {
        
        container.addSubview(episodeCreatedLabel)
        
        episodeCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episodeCreatedLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 10),
            episodeCreatedLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
            episodeCreatedLabel.trailingAnchor.constraint(greaterThanOrEqualTo: container.trailingAnchor)
        ])

    }
    
    private func addConstrainsAirDateLabel() {
        
        container.addSubview(episodeAirDateLabel)
        
        episodeAirDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episodeAirDateLabel.topAnchor.constraint(equalTo: episodeCreatedLabel.bottomAnchor,constant: 10),
            episodeAirDateLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            episodeAirDateLabel.trailingAnchor.constraint(greaterThanOrEqualTo: container.trailingAnchor),
            episodeAirDateLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
        ])

    }
    

    func setupLabels(viewModel: RMEpisodeCellViewModel) {
        episodeNameLabel.attributedText = NSLocalizedString("Name", comment: "").attributedTitleValue(with: viewModel.name)
        episodeCreatedLabel.attributedText = NSLocalizedString("Created", comment: "").attributedTitleValue(with: viewModel.created)
        episodeAirDateLabel.attributedText = NSLocalizedString("Air date", comment: "").attributedTitleValue(with: viewModel.airDate)
    }

}

#Preview ("RMEpisodeHorizontalCell") {
    RMEpisodeHorizontalCell()
}
