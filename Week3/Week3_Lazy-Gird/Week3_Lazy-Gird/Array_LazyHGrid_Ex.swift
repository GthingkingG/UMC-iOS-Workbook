//
//  Array_LazyHGrid_Ex.swift
//  Week3_Lazy-Gird
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct Array_LazyHGrid_Ex: View {
    let rows = Array(repeating: GridItem(.fixed(80)), count: 2)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(1...17, id: \.self) { index in
                    Text("Item \(index)")
                        .frame(width: 80)
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.7))
                }
            }
        }
    }
}

#Preview {
    Array_LazyHGrid_Ex()
}
