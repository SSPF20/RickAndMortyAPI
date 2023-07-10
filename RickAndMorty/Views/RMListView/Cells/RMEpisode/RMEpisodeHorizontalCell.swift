//
//  RMEpisodeHorizontalCelll.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 9/07/23.
//

import Foundation
import UIKit

//Vistas
final class RMEpisodeHorizontalCell: UICollectionViewCell, RMItemCell {
    private let container: UIView = UIView()
    private let nameEpisodeLabel = UILabel()
    private let air_Date_Episode_Label = UILabel()
    private let createdEpisodeLabel = UILabel()
    private let nameEpisode = UILabel()
    private let air_Date = UILabel()
    private let created = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView()
        nameEpisodeView()
        nameEpisodeLabelView()
        air_Date_View()
        air_Date_Label_View()
        createdView()
        createdLabelView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension RMEpisodeHorizontalCell {
    //Asignación de viewModel
    func setup(viewModel: RMItemCellViewModel) {
        guard let viewModel = viewModel as? RMEpisodeCellViewModel else {return}
        nameEpisodeLabel.text = viewModel.name
        createdEpisodeLabel.text = viewModel.created
        air_Date_Episode_Label.text = viewModel.air_Date
    }
}

//MARK: -Views
extension RMEpisodeHorizontalCell {
    
    private func containerView() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0), container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0), container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20), container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        container.layer.borderWidth = 2
        container.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        container.layer.cornerRadius = 20
        container.backgroundColor = .white
    }
    
    private func nameEpisodeView() {
        container.addSubview(nameEpisode)
        nameEpisode.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameEpisode.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            nameEpisode.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10)
        ])
        
        nameEpisode.font = UIFont.preferredFont(forTextStyle: .headline)
        nameEpisode.text = NSLocalizedString("Name: ", comment: "EpisodeCell")
        nameEpisode.textColor = .black
        nameEpisode.setContentCompressionResistancePriority(.required, for: .horizontal)

    }
    
    private func nameEpisodeLabelView() {
        container.addSubview(nameEpisodeLabel)
        nameEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameEpisodeLabel.topAnchor.constraint(equalTo: nameEpisode.topAnchor, constant: 0),
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: nameEpisode.trailingAnchor, constant: 8),
            nameEpisodeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])
        nameEpisodeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameEpisodeLabel.text = NSLocalizedString("Pilot", comment: "RMEpisodeHorizontalCell")
        nameEpisodeLabel.textColor = .black
        nameEpisodeLabel.numberOfLines = 0
        nameEpisodeLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
    }
    
    private func air_Date_View() {
        container.addSubview(air_Date)
        air_Date.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            air_Date.topAnchor.constraint(equalTo: nameEpisodeLabel.bottomAnchor, constant: 10),
            air_Date.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10)
        ])
        
        air_Date.font = UIFont.preferredFont(forTextStyle: .headline)
        air_Date.textColor = .black
        air_Date.text = NSLocalizedString("Air Date: ", comment: "RMEpisodeHorizontalCell")
        air_Date.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    private func air_Date_Label_View() {
        container.addSubview(air_Date_Episode_Label)
        air_Date_Episode_Label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            air_Date_Episode_Label.topAnchor.constraint(equalTo: nameEpisodeLabel.bottomAnchor, constant: 10),
            air_Date_Episode_Label.leadingAnchor.constraint(equalTo: air_Date.trailingAnchor, constant: 10)
        
        ])
        
        air_Date_Episode_Label.font = UIFont.preferredFont(forTextStyle: .body)
        air_Date_Episode_Label.textColor = .black
        air_Date_Episode_Label.text = NSLocalizedString("December 2, 2013", comment: "RMEpisodeHorizontalCell")
        air_Date_Episode_Label.numberOfLines = 0
    }
    
    private func createdView() {
        container.addSubview(created)
        created.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            created.topAnchor.constraint(equalTo: air_Date.bottomAnchor, constant: 10),
            created.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            created.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
        created.font = UIFont.preferredFont(forTextStyle: .headline)
        created.textColor = .black
        created.setContentHuggingPriority(.required, for: .horizontal)
        created.text = NSLocalizedString("Created: ", comment: "RMEpisodeHorizontalCell")
    }
    
    private func createdLabelView() {
        container.addSubview(createdEpisodeLabel)
        createdEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createdEpisodeLabel.topAnchor.constraint(equalTo: air_Date_Episode_Label.bottomAnchor, constant: 10),
            createdEpisodeLabel.leadingAnchor.constraint(equalTo: created.trailingAnchor,constant: 10),
            createdEpisodeLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
        createdEpisodeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        createdEpisodeLabel.textColor = .black
        createdEpisodeLabel.text = NSLocalizedString("2017-11-10T12:56:33.798Z", comment: "RMEpisodeHorizontalCell")
        createdEpisodeLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
}

#Preview ("RMEpisodeHorizontalCell") {
    RMEpisodeHorizontalCell()
    
}
