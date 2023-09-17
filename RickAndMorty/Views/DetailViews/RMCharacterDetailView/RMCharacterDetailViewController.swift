//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 11/08/23.
//

import Foundation
import UIKit

final class RMCharacterDetailViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let imageContainer = UIView()
    let characterImage = UIImageView()
    let nameLabel = UILabel()
    let statusLabel = UILabel()
    let specieLabel = UILabel()
    let typeLabel = UILabel()
    let genderLabel = UILabel()
    let originLabel = UILabel()
    let locationLabel = UILabel()
    let episodelabel = UILabel()
    let episodeList = UILabel()
    let tableView = UITableView()
    let viewModel: RMCharacterDetailViewModel
    
    init(viewModel: RMCharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func getDetail(for character: RMCharacter) -> RMCharacterDetailViewController {
        let viewModel = RMCharacterDetailViewModel(character: character)
        return RMCharacterDetailViewController(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.dataSource = self
        //        tableView.delegate = self
        view.backgroundColor = .systemBackground
        setupScrollView()
        setupStackView()
        addImageContainer()
        addCharacterImage()
        stackView.addArrangedSubview(separatorView(height: 2))
        addNameLabel()
        addStatusLabel()
        addSpecieLabel()
        addTypeLabel()
        addGenderLabel()
        addOriginLabel()
        addLocationLabel()
        stackView.addArrangedSubview(separatorView(height: 2))
        addEpisodeLabel()
        setup(viewModel: viewModel)
    }
    
    func setup(viewModel: RMCharacterDetailViewModel) {
        characterImage.setImage(with: viewModel.imageURL)
        setupLabels(viewModel: viewModel)
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0)
        ])
        
        stackView.spacing = 12
    }
    
    private func addImageContainer() {
        stackView.addArrangedSubview(imageContainer)
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: stackView.topAnchor),
            imageContainer.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            imageContainer.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func addCharacterImage() {
        imageContainer.addSubview(characterImage)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 0),
            characterImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 0),
            characterImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 0),
            characterImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 0)
        ])
        
        characterImage.clipsToBounds = true
        characterImage.layer.cornerRadius = 20
    }
    
    private func addNameLabel() {
        stackView.addArrangedSubview(nameLabel)
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addStatusLabel() {
        stackView.addArrangedSubview(statusLabel)
        statusLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addSpecieLabel() {
        stackView.addArrangedSubview(specieLabel)
        specieLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addTypeLabel() {
        stackView.addArrangedSubview(typeLabel)
        typeLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addGenderLabel() {
        stackView.addArrangedSubview(genderLabel)
        genderLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addOriginLabel() {
        stackView.addArrangedSubview(originLabel)
        originLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addLocationLabel() {
        stackView.addArrangedSubview(locationLabel)
        locationLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addEpisodeLabel() {
        stackView.addArrangedSubview(episodelabel)
        episodelabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        episodelabel.text = "EPISODES"
        episodelabel.textAlignment = .center
    }
    
    private func separatorView(height: CGFloat) -> UIView {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: height).isActive = true
        separator.backgroundColor = .systemGreen
        return separator
    }
    
    private func setupLabels(viewModel: RMCharacterDetailViewModel) {
        nameLabel.attributedText = NSLocalizedString("Name", comment: "").attributedTitleValue(with: viewModel.name)
        statusLabel.attributedText = NSLocalizedString("Status", comment: "").attributedTitleValue(with: viewModel.status.rawValue)
        specieLabel.attributedText = NSLocalizedString("Specie", comment: "").attributedTitleValue(with: viewModel.species)
        typeLabel.attributedText = NSLocalizedString("Type", comment: "").attributedTitleValue(with: viewModel.type)
        genderLabel.attributedText = NSLocalizedString("Gender", comment: "").attributedTitleValue(with: viewModel.gender.rawValue)
        originLabel.attributedText = NSLocalizedString("Origin", comment: "").attributedTitleValue(with: viewModel.origin)
        locationLabel.attributedText = NSLocalizedString("Location", comment: "").attributedTitleValue(with: viewModel.location)
    }
}

