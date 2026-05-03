//
//  HomeView.swift
//  Week3_CoverCarousel
//
//  Created by Air on 5/27/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                Tab("Home", systemImage: "house", value: 0) {
                    ContentView()
                }
                Tab("Other", systemImage: "doc", value: 1) {
                    Text("asdf")
                }
                Tab("Profile", systemImage: "person", value: 2) {
                    Text("zxcv")
                }
                
            }
            .tint(Color.green)
        }
    }
}

#Preview {
    HomeView()
}
