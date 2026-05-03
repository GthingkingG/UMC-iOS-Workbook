//
//  ContentView.swift
//  Observable
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    var viewModel: CounterViewModel = .init()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
            
            Button(action: {
                viewModel.count += 1
            }, label: {
                Text("카운트 증가합니다.")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
