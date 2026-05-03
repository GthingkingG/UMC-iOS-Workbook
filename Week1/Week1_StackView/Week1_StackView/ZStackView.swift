//
//  ZStackView.swift
//  Week1_StackView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct ZStackView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
            Text("중앙 텍스트")
                .font(.title)
                .foregroundStyle(.white)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.clear)
                        .stroke(Color.black, style: .init(lineWidth: 1))
                })
        }
    }
}

#Preview {
    ZStackView()
}
