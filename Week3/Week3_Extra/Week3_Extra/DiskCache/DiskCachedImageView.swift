//
//  DiskCachedImageView.swift
//  Week3_Extra
//
//  Created by Air on 5/25/25.
//

import SwiftUI

struct DiskCachedImageView: View {
    @StateObject private var imageCache = ImageDiskCache.shared
    
    let fileName: String
    let placeholder: Image
    
    var body: some View {
        VStack {
            if let cachedImage = imageCache.image {
                cachedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .shadow(radius: 2)
                    .padding()
            } else {
                placeholder
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .shadow(radius: 2)
                    .padding()
                    .onAppear {
                        imageCache.loadImageFromDisk(fileName: fileName)
                    }
            }
        }
    }
}

