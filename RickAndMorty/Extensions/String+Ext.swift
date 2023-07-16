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
        let urlComponents = self.split(separator: "/")
        if let lastComponent = urlComponents.last, !lastComponent.isEmpty {
            let stringId = String(lastComponent)
            return Int(stringId)
        }
        return nil
    }
    
    static func atributedString(titleText1: String, episodeText: String) -> String {
        
        let attrString = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1), NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let attStringEpisode = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .footnote), NSAttributedString.Key.foregroundColor: UIColor.green]
        
        let atributeContainerTitle = AttributeContainer(attrString)
        let atributeContainerEpisode = AttributeContainer(attStringEpisode)
        let localizedTitle = LocalizedStringResource(stringLiteral: titleText1)
        let localizedEpisode = LocalizedStringResource(stringLiteral: episodeText)

        var atribut1 = AttributedString(localized: localizedTitle)
        atribut1.mergeAttributes(atributeContainerTitle)
        var atribut2 = AttributedString(localized: localizedEpisode)
        atribut2.mergeAttributes(atributeContainerEpisode)
        var compound = atribut1
        compound.append(atribut2)
        let stringToReturn = String(compound.characters)
        
        
        return stringToReturn
     }
}
