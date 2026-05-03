//
//  LazyVStackEx.swift
//  Week3_Lazy-Gird
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct LazyVStackEx: View {
    var body: some View {
        ScrollView(.vertical, content: {
            LazyVStack(spacing: 15, content: {
                ForEach(1...50, id: \.self) { index in
                    Text("아이템: \(index)")
                        .background(Color.green)
                        .frame(width: 100, height: 100)
                }
            })
        })
    }
}

#Preview {
    LazyVStackEx()
}
