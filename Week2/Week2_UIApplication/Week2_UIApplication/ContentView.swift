//
//  ContentView.swift
//  Week2_UIApplication
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    
    var screenSize: CGRect {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return windowScene.screen.bounds
    }
    
    var body: some View {
        VStack {
            Text("Screen Width: \(screenSize.width)")
            Text("Screen Height: \(screenSize.height)")
        }
    }
}

#Preview {
    ContentView()
}
