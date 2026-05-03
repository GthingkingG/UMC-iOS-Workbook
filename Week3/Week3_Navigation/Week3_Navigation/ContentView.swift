//
//  ContentView.swift
//  Week3_Navigation
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go to Detail", destination: DetailView())
        }
    }
}

fileprivate struct DetailView: View {
    var body: some View {
        Text("Hello")
            .navigationTitle("Hello Navi")
    }
}

#Preview {
    ContentView()
}
