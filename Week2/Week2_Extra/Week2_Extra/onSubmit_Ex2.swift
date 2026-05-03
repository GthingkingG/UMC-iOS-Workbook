//
//  onSubmit_Ex2.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onSubmit_Ex2: View {
    @State private var text = ""
    
    var body: some View {
        TextField("이름을 입력하세요", text: $text)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
                hideKeyboard()
            }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    onSubmit_Ex2()
}
