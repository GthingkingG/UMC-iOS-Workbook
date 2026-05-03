//
//  onTapGesture_Ex2.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onTapGesture_Ex2: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture(count: 2) {
                    print("안녕하세요!!")
                }
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    onTapGesture_Ex2()
}
