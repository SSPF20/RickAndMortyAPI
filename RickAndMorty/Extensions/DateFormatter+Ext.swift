//
//  dateFormatter+Ext.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 13/07/23.
//

import Foundation

extension DateFormatter {
    static var iso8601Format: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }
}
