//
//  StackPop.swift
//  Week3_Navigation
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct StackPop: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Go to Detail") {
                    path.append("Detail")
                }
            }
            .navigationDestination(for: String.self) { value in
                DetailsView()
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Detail Page")
            Button("Go Back") {
                dismiss()
            }
        }
        .navigationTitle("Detail")
    }
}

#Preview {
    StackPop()
}
