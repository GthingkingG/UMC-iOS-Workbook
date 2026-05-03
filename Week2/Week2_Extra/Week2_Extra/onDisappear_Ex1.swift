//
//  onDisappear_Ex1.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onDisappear_Ex1: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .onDisappear {
                print("뷰가 사라졌습니다!")
            }
    }
}

#Preview {
    onDisappear_Ex1()
}
