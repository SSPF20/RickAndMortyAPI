import Foundation
import UIKit

final class RMCharacterSpecieView: UIView {
    
    private var specieContainer = UIView()
    private var specieLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        addSpecieContainer()
        addSpecieLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSpecieContainer() {
        addSubview(specieContainer)
        specieContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            specieContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            specieContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            specieContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            specieContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
        
        specieContainer.backgroundColor = .blue
        specieContainer.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
    }
    
    func addSpecieLabel() {
        specieContainer.addSubview(specieLabel)
        specieLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            specieLabel.topAnchor.constraint(equalTo: specieContainer.topAnchor, constant: 0),
            specieLabel.bottomAnchor.constraint(equalTo: specieContainer.bottomAnchor, constant: 0),
            specieLabel.leadingAnchor.constraint(equalTo: specieContainer.leadingAnchor, constant: 0),
            specieLabel.trailingAnchor.constraint(equalTo: specieContainer.trailingAnchor, constant: 0)
        ])
        specieLabel.textColor = .white
        specieLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        specieLabel.textAlignment = .center
        specieLabel.text = "Alien"
    }
}

#Preview ("RMCharacterSpecieView") {
    RMCharacterSpecieView()
}
