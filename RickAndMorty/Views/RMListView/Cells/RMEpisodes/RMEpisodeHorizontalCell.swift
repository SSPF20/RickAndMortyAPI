//
//  RMEpisodeHorizontalCell.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 7/07/23.
//

import UIKit

final class RMEpisodeCellViewModel: RMItemCellViewModel {
    
    private var episodeData: RMEpisode
    
    var name: String {
        episodeData.name
    }
    
    var airDate: String {
        episodeData.air_date
    }
    
    var episode: String {
        episodeData.episode
    }
    
    init(episodeData: RMEpisode) {
        self.episodeData = episodeData
        super.init(id: episodeData.id)
    }
}

final class RMEpisodeHorizontalCell: UICollectionViewCell, RMItemCell {
    
    private var container = UIView()
    private var nameLabel = UILabel()
    private var episodeNameLabel = UILabel()
    private var airDateLabel = UILabel()
    private var episodeAirDateLabel = UILabel()
    private var episodeLabel = UILabel()
    private var episodeEpisodeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContainer()
        addNameLabel()
        addEpisodeNameLabel()
        addAirDateLabel()
        addEpisodeAirDateLabel()
        addEpisodeLabel()
        addEpisodeEpisodeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: RMItemCellViewModel) {
        guard let viewModel = viewModel as? RMEpisodeCellViewModel else {
            return
        }
        
        episodeNameLabel.text = viewModel.name
        episodeAirDateLabel.text = viewModel.airDate
        episodeEpisodeLabel.text = viewModel.episode
    }
}

extension RMEpisodeHorizontalCell {
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
        container.backgroundColor = .white
    }
    
    private func addNameLabel() {
        container.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8)
        ])
        
        nameLabel.text = "Name:"
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    private func addEpisodeNameLabel() {
        container.addSubview(episodeNameLabel)
        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            episodeNameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 0),
            episodeNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            episodeNameLabel.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: container.trailingAnchor, multiplier: -20)
        ])
        
        episodeNameLabel.text = "Pilot"
        episodeNameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        episodeNameLabel.numberOfLines = 0
        episodeNameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        episodeNameLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private func addAirDateLabel() {
        container.addSubview(airDateLabel)
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            airDateLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8)
        ])
        
        airDateLabel.text = "Air date:"
        airDateLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addEpisodeAirDateLabel() {
        container.addSubview(episodeAirDateLabel)
        episodeAirDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            episodeAirDateLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 10),
            episodeAirDateLabel.leadingAnchor.constraint(equalTo: airDateLabel.trailingAnchor, constant: 8)
        ])
        
        episodeAirDateLabel.text = "December 2, 2013"
        episodeAirDateLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    private func addEpisodeLabel() {
        container.addSubview(episodeLabel)
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            episodeLabel.topAnchor.constraint(equalTo: airDateLabel.bottomAnchor, constant: 10),
            episodeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
            episodeLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
        
        episodeLabel.text = "Episode:"
        episodeLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addEpisodeEpisodeLabel() {
        container.addSubview(episodeEpisodeLabel)
        episodeEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            episodeEpisodeLabel.topAnchor.constraint(equalTo: episodeAirDateLabel.bottomAnchor, constant: 10),
            episodeEpisodeLabel.leadingAnchor.constraint(equalTo: episodeLabel.trailingAnchor, constant: 8),
            episodeEpisodeLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
        
        episodeEpisodeLabel.text = "S01E01"
        episodeEpisodeLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
}

#Preview("RMEpisodeHorizontalCell") {
    RMEpisodeHorizontalCell()
}
