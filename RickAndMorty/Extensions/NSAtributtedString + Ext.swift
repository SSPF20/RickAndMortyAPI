//
//  NSAtributteString.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 15/07/23.
//

import Foundation
import UIKit

extension NSAttributedString {
    
   static func atributesString(titleText1: String, episodeText: String) -> NSAttributedString {
        let attrString = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.black]
       let compoundString = titleText1 + episodeText
       let stringToReturn = NSMutableAttributedString(string: compoundString , attributes: attrString)
       return stringToReturn
    }
    
}
