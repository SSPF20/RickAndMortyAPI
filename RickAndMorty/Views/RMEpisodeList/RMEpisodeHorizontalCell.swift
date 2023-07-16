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
    private var episodeNameLabel = UILabel()
    private let episodeAirDateLabel = UILabel()
    private let episodeCreatedLabel = UILabel()
    private let verticalStack = UIStackView()
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView()
        stackView()
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Asignación de viewModel
    func setup(viewModel: RMItemCellViewModel) {
        guard let viewModel = viewModel as? RMEpisodeCellViewModel else {return}
        viewsSetUp(viewModel: viewModel)
    }
    
    override func prepareForReuse() {
        episodeNameLabel.text = ""
        episodeAirDateLabel.text = ""
        episodeCreatedLabel.text = ""
    }
    
}

//MARK: -Views
extension RMEpisodeHorizontalCell {
    
    private func containerView() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        container.layer.borderWidth = 2
        container.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        container.layer.cornerRadius = 20
        container.backgroundColor = .white
    }
    
    private func stackView() {
        
        container.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        verticalStack.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
        verticalStack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5),
        verticalStack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
        verticalStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10)
        ])
        
        verticalStack.axis = .vertical
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 10
        
    }
    
    private func addViews() {
        verticalStack.addArrangedSubview(episodeNameLabel)
        verticalStack.addArrangedSubview(episodeCreatedLabel)
        verticalStack.addArrangedSubview(episodeAirDateLabel)
    }
    
    func viewsSetUp(viewModel: RMEpisodeCellViewModel) {
       
        episodeNameLabel.attributedText = NSAttributedString.atributesString(titleText1: "Name: ", episodeText: viewModel.name)
        episodeCreatedLabel.attributedText = NSAttributedString.atributesString(titleText1: "Created: ", episodeText: viewModel.created.formatted(date: .long, time: .shortened))
        episodeAirDateLabel.attributedText = NSAttributedString.atributesString(titleText1: "air date: ", episodeText: viewModel.airDate)
        
    }

}

#Preview("RMEpisodeHorizontalCell") {
    RMEpisodeHorizontalCell()
}
