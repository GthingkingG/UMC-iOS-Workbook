//
//  DynamicLayoutView.swift
//  Week2_GeometryReader
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct DynamicLayoutView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("전체 화면의 50% 크기 박스")
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.3)
                    .background(Color.green.opacity(0.5))
                    .border(Color.green)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .border(Color.red)
        }
    }
}

#Preview {
    DynamicLayoutView()
}
