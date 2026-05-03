//
//  ViewPositionExample.swift
//  Week2_GeometryReader
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct ViewPositionExample: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("뷰의 X 좌표: \(geometry.frame(in: .global).origin.x)")
                Text("뷰의 Y 좌표: \(geometry.frame(in: .global).origin.y)")
            }
            .frame(width: 200, height: 100)
            .background(Color.orange.opacity(0.5))
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}

#Preview {
    ViewPositionExample()
}
