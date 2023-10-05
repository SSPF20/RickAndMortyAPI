//
//  FooterPageView.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 2/10/23.
//

import Foundation
import UIKit

final class FooterPageView: UICollectionReusableView {
    
    static var identifier = "FooterPage"
    var label = UILabel()
    var page = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabelView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLabelView() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let constrains: [NSLayoutConstraint] =
        [label.centerXAnchor.constraint(equalTo: centerXAnchor),
         label.centerYAnchor.constraint(equalTo: centerYAnchor)]
        NSLayoutConstraint.activate(constrains)
        label.numberOfLines = 0
        label.textColor = .black

    }
    
    func incrementPageNumber() {
        page += 1
        label.text = "Page number \(page)"
    }
    
}
