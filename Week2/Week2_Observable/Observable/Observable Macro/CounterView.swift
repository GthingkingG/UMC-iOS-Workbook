//
//  CounterView.swift
//  Observable
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct CounterView: View {
    private var counter = Counter()
    
    var body: some View {
        VStack {
            Text("Count: \(counter.count)")
            Button("Increment") {
                counter.count += 1
            }
            ChildView(counter: counter)
        }
    }
}

#Preview {
    CounterView()
}
