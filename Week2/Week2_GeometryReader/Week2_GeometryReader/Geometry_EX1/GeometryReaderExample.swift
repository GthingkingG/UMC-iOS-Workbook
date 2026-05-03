//
//  GeometryReaderExample.swift
//  Week2_GeometryReader
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("뷰 너비: \(geometry.size.width)")
                Text("뷰 높이: \(geometry.size.height)")
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.blue.opacity(0.3))
        }
    }
}

#Preview {
    GeometryReaderExample()
}
