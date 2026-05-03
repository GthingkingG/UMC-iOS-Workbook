//
//  ScrollIndicator.swift
//  Week3_ScrollView
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ScrollIndicator: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(1...50, id: \.self) { index in
                    Text("Item \(index)")
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                }
            }
        }
        .scrollIndicators(.visible, axes: .vertical)
        .contentMargins(.horizontal, 0, for: .scrollIndicators)
    }
}

#Preview {
    ScrollIndicator()
}
