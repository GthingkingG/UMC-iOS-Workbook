//
//  ContentView.swift
//  Week1_Preview
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
//
//#Preview("iPhone 11") {
//    ContentView()
//}
//
//#Preview("iPhone 16 Pro") {
//    ContentView()
//}

struct ContentView_Preiview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro", "iPhone 16", "iPad mini (A17 Pro)"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
