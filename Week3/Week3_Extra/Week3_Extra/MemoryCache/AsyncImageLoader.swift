//
//  AsyncImageLoader.swift
//  Week3_Extra
//
//  Created by Air on 5/25/25.
//

import SwiftUI

class AsyncImageLoader: ObservableObject {
    @Published var image: Image?
    
    private var cache = ImageCache.shared
    
    init(url: String) {
        loadImage(from: url)
    }
    
    private func loadImage(from urlString: String) {
        let cacheKey = urlString as NSString
        
        if let cachedImage = cache.getImage(forKey: urlString) {
            self.image = Image(uiImage: cachedImage)
            print("캐시에서 이미지 로드: \(urlString)")
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, let uiImage = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                    self.cache.setImage(uiImage, forKey: urlString)
                    print("네트워크에서 이미지 다운로드: \(urlString)")
            }
        }.resume()
    }
}
