//
//  RMEpisodeDetailViewController.swift
//  RMCharacterDetailView
//
//  Created by Simon on 19/07/23.
//

import Foundation
import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    private var stackView = UIStackView()
    private var nameLabel = UILabel()
    private var airDateLabel = UILabel()
    private var episodeLabel = UILabel()
    private var charactersLabel = UILabel()
    private var separator = UIView()
    private var viewModel: RMEpisodeDetailViewModel
    
    init(viewModel: RMEpisodeDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func getDetail(for episode: RMEpisode) -> RMEpisodeDetailViewController {
        let viewModel = RMEpisodeDetailViewModel(rmEpisode: episode)
        return RMEpisodeDetailViewController(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupScrollView()
        setupStackView()
        addNameLabel()
        addAirDateLabel()
        addEpisodeLabel()
        addSeparator()
        addCharactersLabel()
        setup(viewModel: viewModel)
    }
    
    private func setup(viewModel: RMEpisodeDetailViewModel) {
        setupLabels(viewModel: viewModel)
    }
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        stackView.spacing = 12
    }
    
    private func addNameLabel() {
        stackView.addArrangedSubview(nameLabel)
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addAirDateLabel() {
        stackView.addArrangedSubview(airDateLabel)
        airDateLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addEpisodeLabel() {
        stackView.addArrangedSubview(episodeLabel)
        episodeLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    private func addCharactersLabel() {
        stackView.addArrangedSubview(charactersLabel)
        charactersLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        charactersLabel.text = "CHARACTERS"
        charactersLabel.textAlignment = .center
    }
    
    private func addSeparator() {
        stackView.addArrangedSubview(separator)
        separator.separatorView(height: 2)
        separator.backgroundColor = .systemGreen
    }
    
    private func setupLabels(viewModel: RMEpisodeDetailViewModel) {
        nameLabel.attributedText = NSLocalizedString("Name", comment: "").attributedTitleValue(with: viewModel.name)
        airDateLabel.attributedText = NSLocalizedString("Air Date", comment: "").attributedTitleValue(with: viewModel.airDate)
        episodeLabel.attributedText = NSLocalizedString("Episode", comment: "").attributedTitleValue(with: viewModel.episode)
    }
    
    
}
