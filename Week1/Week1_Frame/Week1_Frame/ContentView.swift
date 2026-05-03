//
//  ContentView.swift
//  Week1_Frame
//
//  Created by Air on 5/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, swiftUI!")
            .frame(width: 200, height: 100)
            .background(Color.blue)
        
        Text("Resizable Text")
            .frame(minWidth: 100, idealWidth: 200, maxWidth: 300, minHeight: 50, maxHeight: 150)
            .background(Color.green)
        
        Text("Full Width")
            .frame(maxWidth: .infinity)
            .background(Color.orange)
    }
}

#Preview {
    ContentView()
}
