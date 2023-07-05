//
//  UIImage+Ext.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 5/07/23.
//

import UIKit

extension UIImage {
    static var defaultCharacterPlaceHolder: UIImage {
        guard let image = UIImage(named: "PlaceHolder") else {
            fatalError("There should be a Placeholder Image for character")
        }
        return image
    }
}
