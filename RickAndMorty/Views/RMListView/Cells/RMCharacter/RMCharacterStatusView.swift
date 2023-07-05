//
//  RMCharacterCellView.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 15/06/23.
//

import Foundation
import UIKit

final class RMCharacterStatusView: UIView {
    
    private var statusContainer = UIView()
    private var statusLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        addStatusContainer()
        addStatusLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(status: RMCharacter.Status) {
        statusLabel.text = status.string
        switch (status) {
        case .alive:
            statusContainer.backgroundColor = .green
        case .dead:
            statusContainer.backgroundColor = .systemRed
        case .unknown:
            statusContainer.backgroundColor = .lightGray
        }
    }
    
    func prepareForReuse() {
        statusContainer.backgroundColor = .clear
        statusLabel.text = ""
    }
    
    private func addStatusContainer() {
        addSubview(statusContainer)
        statusContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            statusContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            statusContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            statusContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            statusContainer.heightAnchor.constraint(equalToConstant: 20)
        ])
        statusContainer.backgroundColor = .green
        statusContainer.layer.cornerRadius = 7
    }
    
    private func addStatusLabel() {
        statusContainer.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: statusContainer.topAnchor, constant: 0),
            statusLabel.leadingAnchor.constraint(equalTo: statusContainer.leadingAnchor, constant: 10),
            statusLabel.bottomAnchor.constraint(equalTo: statusContainer.bottomAnchor, constant: 0),
            statusLabel.trailingAnchor.constraint(equalTo: statusContainer.trailingAnchor, constant: -10)
            
        ])
        
        statusLabel.textColor = .white
        statusLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        statusLabel.textAlignment = .center
    }
}

#Preview("Alive") {
    
    let view = RMCharacterStatusView()
    view.setup(status: .alive)
    
    return view
}

#Preview("Dead") {
    
    let view = RMCharacterStatusView()
    view.setup(status: .dead)
    
    return view
}

#Preview("Unknown") {
    
    let view = RMCharacterStatusView()
    view.setup(status: .unknown)
    
    return view
}
