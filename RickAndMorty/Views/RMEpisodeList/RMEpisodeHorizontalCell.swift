//
//  RMEpisodeHorizontalCell.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 11/07/23.
//

import Foundation
import UIKit

//Vistas
final class RMEpisodeHorizontalCell: UICollectionViewCell, RMItemCell {
    
    private let container: UIView = UIView()
    private let nameEpisodeLabel = UILabel()
    private let airDateEpisodeLabel = UILabel()
    private let createdEpisodeLabel = UILabel()
    private let nameEpisodeTitle = UILabel()
    private let airDateTitle = UILabel()
    private let createdTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView()
        nameEpisodeView()
        nameEpisodeLabelView()
        air_Date_View()
        airDateLabelView()
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
        createdEpisodeLabel.text = viewModel.created.formatted(date: .long, time: .shortened)
        airDateEpisodeLabel.text = viewModel.airDate
    }
    
    override func prepareForReuse() {
        nameEpisodeLabel.text = ""
        airDateEpisodeLabel.text = ""
        createdEpisodeLabel.text = ""
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
        container.addSubview(nameEpisodeTitle)
        nameEpisodeTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameEpisodeTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            nameEpisodeTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10)
        ])
        
        nameEpisodeTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        nameEpisodeTitle.text = NSLocalizedString("Name: ", comment: "EpisodeCell")
        nameEpisodeTitle.textColor = .black
        nameEpisodeTitle.setContentCompressionResistancePriority(.required, for: .horizontal)

    }
    
    private func nameEpisodeLabelView() {
        container.addSubview(nameEpisodeLabel)
        nameEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameEpisodeLabel.topAnchor.constraint(equalTo: nameEpisodeTitle.topAnchor, constant: 0),
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: nameEpisodeTitle.trailingAnchor, constant: 8),
            nameEpisodeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])
        nameEpisodeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameEpisodeLabel.textColor = .black
        nameEpisodeLabel.numberOfLines = 0
        nameEpisodeLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
    }
    
    private func air_Date_View() {
        container.addSubview(airDateTitle)
        airDateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            airDateTitle.topAnchor.constraint(equalTo: nameEpisodeLabel.bottomAnchor, constant: 10),
            airDateTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10)
        ])
        
        airDateTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        airDateTitle.textColor = .black
        airDateTitle.text = NSLocalizedString("Air Date: ", comment: "RMEpisodeHorizontalCell")
        airDateTitle.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    private func airDateLabelView() {
        container.addSubview(airDateEpisodeLabel)
        airDateEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            airDateEpisodeLabel.topAnchor.constraint(equalTo: nameEpisodeLabel.bottomAnchor, constant: 10),
            airDateEpisodeLabel.leadingAnchor.constraint(equalTo: airDateTitle.trailingAnchor, constant: 10)
        
        ])
        
        airDateEpisodeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        airDateEpisodeLabel.textColor = .black
        airDateEpisodeLabel.numberOfLines = 0
    }
    
    private func createdView() {
        container.addSubview(createdTitle)
        createdTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createdTitle.topAnchor.constraint(equalTo: airDateTitle.bottomAnchor, constant: 10),
            createdTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            createdTitle.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
        createdTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        createdTitle.textColor = .black
        createdTitle.setContentHuggingPriority(.required, for: .horizontal)
        createdTitle.text = NSLocalizedString("Created: ", comment: "RMEpisodeHorizontalCell")
    }
    
    private func createdLabelView() {
        container.addSubview(createdEpisodeLabel)
        createdEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createdEpisodeLabel.topAnchor.constraint(equalTo: airDateEpisodeLabel.bottomAnchor, constant: 10),
            createdEpisodeLabel.leadingAnchor.constraint(equalTo: createdTitle.trailingAnchor,constant: 10),
            createdEpisodeLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
        createdEpisodeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        createdEpisodeLabel.textColor = .black
        createdEpisodeLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
    
}


#Preview ("RMEpisodeHorizontalCell") {
    RMEpisodeHorizontalCell()
    
}
