//
//  onChange_Ex1.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onChange_Ex1: View {
    @State private var text = ""
    
    var body: some View {
        TextField("입력하세요", text: $text)
            .padding()
            .onChange(of: text) { oldValue, newValue in
                print("텍스트 변경됨: \(oldValue) -> \(newValue)")
            }
    }
}

#Preview {
    onChange_Ex1()
}
