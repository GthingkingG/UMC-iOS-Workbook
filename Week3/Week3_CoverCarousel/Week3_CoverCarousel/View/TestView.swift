//
//  TestView.swift
//  Week3_CoverCarousel
//
//  Created by Air on 5/29/25.
//

import SwiftUI

struct TestView: View {
    private var colosArr: [Color] = [.red, .green, .yellow, .blue, .orange, .brown, .indigo]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 25) {
                ForEach(0..<colosArr.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(colosArr[index])
                        .shadow(radius: 5, x: 5, y: 5)
                        .frame(width: UIScreen.main.bounds.width - 100, height: 400)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1: 0.5)
                                .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(50, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    TestView()
}
