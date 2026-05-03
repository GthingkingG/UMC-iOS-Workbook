//
//  CachedImageView.swift
//  Week3_Extra
//
//  Created by Air on 5/25/25.
//

import SwiftUI

struct CachedImageView: View {
    @StateObject private var loader: AsyncImageLoader
    
    init(url: String) {
        _loader = StateObject(wrappedValue: AsyncImageLoader(url: url))
    }
    
    var body: some View {
        loader.image?
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .onAppear {
                print("CachedImageView가 나타남")
            }
    }
}

#Preview {
    CachedImageView(url: "https://hws.dev/paul2.jpg")
}
