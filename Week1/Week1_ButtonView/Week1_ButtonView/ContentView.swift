//
//  ContentView.swift
//  Week1_ButtonView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button Clicked!")
        }) {
            Text("Tap Here")
                .padding()
                .background(Color.blue)
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    ContentView()
}
