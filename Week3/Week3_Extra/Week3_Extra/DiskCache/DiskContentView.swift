//
//  DiskContentView.swift
//  Week3_Extra
//
//  Created by Air on 5/25/25.
//

import SwiftUI

struct DiskContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI 디스크 캐싱 예제")
                .font(.headline)
            
            DiskCachedImageView(fileName: "profile_image.png", placeholder: Image(systemName: "person.circle"))
        }
    }
}

#Preview {
    DiskContentView()
}
