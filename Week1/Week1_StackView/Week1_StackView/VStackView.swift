//
//  VStackView.swift
//  Week1_StackView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct VStackView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("첫 번째 요소")
                .font(.title)
            Text("두 번째 요소")
                .font(.headline)
            Text("세 번째 요소")
                .font(.subheadline)
        }
    }
}

#Preview {
    VStackView()
}
