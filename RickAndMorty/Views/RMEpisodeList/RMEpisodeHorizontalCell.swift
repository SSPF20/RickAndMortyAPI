//
//  RMEpisodeHorizontalCell.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 11/07/23.
//

import Foundation
import UIKit

final class RMEpisodeHorizontalCell: UICollectionViewCell, RMItemCell {
    
    private let container: UIView = UIView()
    private let stackView = UIStackView()
    private var episodeNameLabel = UILabel()
    private let episodeAirDateLabel = UILabel()
    private let episodeCreatedLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addContainerView()
        addStackView()
        addLabels()
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
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        container.layer.borderWidth = 2
        container.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        container.layer.cornerRadius = 20
        container.backgroundColor = .white
    }
    
    private func addStackView() {

        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
    }
    
    private func addLabels() {
        
        stackView.addArrangedSubview(episodeNameLabel)
        stackView.addArrangedSubview(episodeCreatedLabel)
        stackView.addArrangedSubview(episodeAirDateLabel)
        
    }
    

    func setupLabels(viewModel: RMEpisodeCellViewModel) {
        episodeNameLabel.attributedText = NSLocalizedString("Name", comment: "").attributedTitleValue(with: viewModel.name)
        episodeCreatedLabel.attributedText = NSLocalizedString("Created", comment: "").attributedTitleValue(with: viewModel.created)
        episodeAirDateLabel.attributedText = NSLocalizedString("Air date", comment: "").attributedTitleValue(with: viewModel.airDate)
    }

}
