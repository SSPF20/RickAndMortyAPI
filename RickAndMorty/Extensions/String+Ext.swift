//
//  String+Ext.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 11/06/23.
//

import Foundation

extension String {
    var urlID: Int? {
        let urlComponents = self.split(separator: "/")
        if let lastComponent = urlComponents.last, !lastComponent.isEmpty {
            let stringId = String(lastComponent)
            return Int(stringId)
        }
        return nil
    }
}
