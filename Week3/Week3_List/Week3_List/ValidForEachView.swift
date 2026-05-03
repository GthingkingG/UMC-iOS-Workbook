//
//  ValidForEachView.swift
//  Week3_List
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ValidForEachView: View {
    let fruits = [
        FFruit(name: "Apple", emoji: "🍎"),
        FFruit(name: "Banana", emoji: "🍌"),
        FFruit(name: "Orange", emoji: "🍊")
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.name) { fruit in
                HStack {
                    Text(fruit.emoji)
                    Text(fruit.name)
                }
            }
        }
    }
}

#Preview {
    ValidForEachView()
}
