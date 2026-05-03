//
//  ForEachIdentifiableView.swift
//  Week3_List
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ForEachIdentifiableView: View {
    let fruits = [
        Fruit(name: "Apple", emoji: "🍎"),
        Fruit(name: "Banana", emoji: "🍌"),
        Fruit(name: "Orange", emoji: "🍊"),
        Fruit(name: "Grape", emoji: "🍇"),
        Fruit(name: "Strawberry", emoji: "🍓")
    ]
    
    var body: some View {
        List {
            ForEach(fruits) { fruit in
                HStack {
                    Text(fruit.emoji)
                    Text(fruit.name)
                        .font(.headline)
                }
            }
        }
    }
}

struct ForEachIdentifiableView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachIdentifiableView()
    }
}
