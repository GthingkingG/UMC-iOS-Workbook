//
//  NavigationPath_Ex.swift
//  Week3_Navigation
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct NavigationPath_Ex: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Go to Detail") {
                    path.append("Detail")
                }
                Button("Go to Detail2") {
                    path.append("Detail2")
                }
            }
            .navigationDestination(for: String.self) { value in
                DetailingView(title: value)
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailingView: View {
    let title: String
    
    var body: some View {
        Text("This is \(title) View")
            .navigationTitle(title)
    }
}

#Preview {
    NavigationPath_Ex()
}
