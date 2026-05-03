//
//  ContentView.swift
//  Week2_AppStorage
//
//  Created by Air on 5/17/25.
//

import SwiftUI



struct ContentView: View {
    @AppStorage("username") var username: String = "Guest"
    
    var body: some View {
        VStack {
            Text("Hello, \(username)!")
            Button("이름 변경") {
                username = "One"
            }
        }
    }
}

#Preview {
    ContentView()
}
