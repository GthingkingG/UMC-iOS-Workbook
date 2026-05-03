//
//  DownsampledImageView.swift
//  Week3_Extra
//
//  Created by Air on 5/25/25.
//

import SwiftUI

struct DownsampledImageView: View {
    let imageURL: URL
    let targetSize: CGSize
    
    var body: some View {
        if let downsampledImage = downsampledImage(at: imageURL, to: targetSize, scale: UIScreen.main.scale) {
            Image(uiImage: downsampledImage)
                .resizable()
                .scaledToFit()
        } else {
            Text("이미지를 불러올 수 없습니다.")
        }
    }
}


