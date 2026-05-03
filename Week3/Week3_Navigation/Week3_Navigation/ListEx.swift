//
//  ListEx.swift
//  Week3_Navigation
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct ListEx: View {
    let items = ["Apple", "Banana", "Cherry", "Mango"]
    
    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(destination: DetailedView(item: item)) {
                    Text(item)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct DetailedView: View {
    let item: String
    
    var body: some View {
        Text("Selected: \(item)")
            .font(.largeTitle)
            .navigationTitle(item)
    }
}

#Preview {
    ListEx()
}
