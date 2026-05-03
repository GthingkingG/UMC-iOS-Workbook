//
//  GirdEx.swift
//  Week3_Lazy-Gird
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct GirdEx: View {
    let rows = [
        GridItem(.fixed(30), spacing: 1),
        GridItem(.flexible(minimum: 20, maximum: 60), spacing: 10),
        GridItem(.fixed(90), spacing: 20),
        GridItem(.flexible(minimum: 30, maximum: 70), spacing: 50)
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 5) {
                ForEach(0...300, id: \.self) { _ in
                    Color.red.frame(width: 30)
                    Color.green.frame(width: 30)
                    Color.blue.frame(width: 30)
                    Color.yellow.frame(width: 30)
                }
            }
        }
    }
}

#Preview {
    GirdEx()
}
