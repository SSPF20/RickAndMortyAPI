//
//  UIImageView+Ext.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 5/07/23.
//

import UIKit

extension UIImageView {
    
    @MainActor
    func setImage(with url: URL?, placeholder: UIImage? = .defaultCharacterPlaceHolder, using urlSession: URLSession = URLSession.shared) {
        Task {
            guard let url else {
                self.image = placeholder
                return
            }
            
            let cache = NSCache<NSString, UIImage>()
            let urlNSString = NSString(string: url.absoluteString)
            
            if let cachedImage = cache.object(forKey: urlNSString) {
                self.image = cachedImage
            } else {
                guard let (data, _) = try? await urlSession.data(from: url) else {
                    self.image = placeholder
                    return
                }
                
                let image = UIImage(data: data)
                self.image = image
                if let image {
                    cache.setObject(image, forKey: urlNSString)
                }
            }
        }
    }
}
