//
//  onAppear_Ex1.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onAppear_Ex1: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                print("뷰가 나타났습니다!")
            }
    }
}

#Preview {
    onAppear_Ex1()
}
