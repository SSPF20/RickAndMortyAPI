//
//  UIView+Ext.swift
//  RMCharacterDetailView
//
//  Created by Simon on 19/07/23.
//

import UIKit

extension UIView {
    func separatorView(height: CGFloat) {
        self.backgroundColor = .lightGray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
