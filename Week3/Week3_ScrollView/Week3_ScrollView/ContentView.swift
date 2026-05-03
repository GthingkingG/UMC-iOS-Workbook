//
//  ContentView.swift
//  Week3_ScrollView
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ContentView: View {
    let rows = Array(repeating: GridItem(.fixed(80)), count: 2)
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.3))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
