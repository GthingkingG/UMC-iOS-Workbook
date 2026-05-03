//
//  HstackView.swift
//  Week1_StackView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct HstackView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 32) {
            Image(systemName: "star.fill")
            Text("즐겨찾기")
                .font(.headline)
            Image(systemName: "star.fill")
            Text("즐겨찾기")
                .font(.headline)
            Label(title: {
                Text("즐겨찾기")
                    .font(.headline)
            }, icon: {
                Image(systemName: "star.fill")
            })
        }
    }
}

#Preview {
    HstackView()
}
