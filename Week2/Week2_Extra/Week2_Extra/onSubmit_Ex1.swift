//
//  onSubmit_Ex1.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onSubmit_Ex1: View {
    @State private var text = ""
    
    var body: some View {
        TextField("입력하세요", text: $text)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
                print("사용자가 입력완료: \(text)")
            }
    }
}

#Preview {
    onSubmit_Ex1()
}
