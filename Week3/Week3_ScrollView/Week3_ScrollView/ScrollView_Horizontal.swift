//
//  ScrollView_Horizontal.swift
//  Week3_ScrollView
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ScrollView_Horizontal: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(1..<10) { index in
                    Text("Item \(index)")
                        .frame(width: 100, height: 100)
                        .background(Color.purple.opacity(0.3))
                }
            }
        }
    }
}

#Preview {
    ScrollView_Horizontal()
}
