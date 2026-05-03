//
//  onTapGesture_Ex1.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onTapGesture_Ex1: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture {
                    print("안녕하세요")
                }
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    onTapGesture_Ex1()
}
