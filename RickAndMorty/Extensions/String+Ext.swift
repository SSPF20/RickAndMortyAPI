//
//  String+Ext.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 11/06/23.
//

import Foundation
import UIKit

extension String {
    var urlID: Int? {
        if self.contains("?page=") {
            guard let value = self.split(separator: "=").last,
                  let intID = Int(value) else {
                return nil
            }
            return intID
        } else {
            let urlComponents = self.split(separator: "/")
            guard let lastComponent = urlComponents.last,
                  let intID = Int(String(lastComponent)) else {
                return nil
            }
            return intID
        }
    }
    
    func attributedTitleValue(with value: String) -> NSAttributedString {
        let keyAttributes = [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        let valueAttributes = [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        
        let key = "\(self): "
        
        let keyAttributedString = NSAttributedString(string: key, attributes: keyAttributes)
        let valueAttributedString = NSAttributedString(string: value, attributes: valueAttributes)
        
        let resultAttributedString = NSMutableAttributedString(attributedString: keyAttributedString)
        resultAttributedString.append(valueAttributedString)
        
        return resultAttributedString
    }
}
