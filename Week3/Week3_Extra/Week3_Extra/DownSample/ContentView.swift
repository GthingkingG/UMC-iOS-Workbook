//
//  ContentView.swift
//  Week3_Extra
//
//  Created by Air on 5/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            if let imageURL = Bundle.main.url(forResource: "large_image", withExtension: "jpg") {
                DownsampledImageView(imageURL: imageURL, targetSize: CGSize(width: 200, height: 200))
            } else {
                Text("이미지 파일을 찾을 수 없습니다.")
            }
        }
    }
}

#Preview {
    ContentView()
}
