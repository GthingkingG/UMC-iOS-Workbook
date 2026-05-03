//
//  ForEachArrayView.swift
//  Week3_List
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ForEachArrayView: View {
    let fruits = ["🍎 Apple", "🍌 Banana", "🍊 Orange", "🍇 Grape", "🍓 Strawberry"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
                    .font(.title2)
            }
        }
    }
}

#Preview {
    ForEachArrayView()
}
