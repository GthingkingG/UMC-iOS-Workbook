//
//  ImageCache.swift
//  Week3_Extra
//
//  Created by Air on 5/25/25.
//

import SwiftUI

class ImageCache: ObservableObject {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}
