//
//  ContentView.swift
//  Week3_Cocoapods
//
//  Created by Air on 5/26/25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    var body: some View {
        VStack {
            if let url = URL(string: "https://i.namu.wiki/i/olH6wMAHFNKpFO0wQUTwnqwdNflD5nZJ1ipJ1szT8S15bZ2Om_AQB9JSyYjdkNvtLlz3sKVtde1A4PNy__x8w-m3FHiuBzWNtG1gIDn_r9RwI0BgDU-3dg2v6CpPZfqYFGZ18ANx9Ay1vUG9u2_swA.webp") {
                KFImage(url)
//                    .downsampling(size: CGSize(width: 400, height: 400)) -> 다운로드 및 캐싱 전에만 다운샘플링
                    .setProcessor([DownsamplingImageProcessor(size: CGSize(width: 400, height: 400)), RoundCornerImageProcessor(radius: .heightFraction(0.5))])
                    .cacheOriginalImage()
                    .placeholder({
                        ProgressView()
                            .controlSize(.mini)
                    }).retry(maxCount: 2, interval: .seconds(2))
//                    .onFailure { error in
//                        print("이미지 로드 실패: \(error)")
//                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            Text("경복궁입니다.")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
