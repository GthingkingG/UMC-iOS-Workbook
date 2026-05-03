//
//  ScrollView_Vertical.swift
//  Week3_ScrollView
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ScrollView_Vertical: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(1..<30) { index in
                    Text("Row \(index)")
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.3))
                }
            }
        }
    }
}

#Preview {
    ScrollView_Vertical()
}
