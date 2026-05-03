//
//  Array_LazyVGrid_Ex.swift
//  Week3_Lazy-Gird
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct Array_LazyVGrid_Ex: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(1...20, id: \.self) { index in
                    Text("Item \(index)")
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.7))
                }
            }
        }
    }
}

#Preview {
    Array_LazyVGrid_Ex()
}
