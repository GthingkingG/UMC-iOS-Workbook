//
//  SubViewStructExample.swift
//  Week1_StackView
//
//  Created by Air on 5/9/25.
//

import SwiftUI


 
struct SubViewStructExample: View {
    var body: some View {
        HeaderView(text: "헤더입니다.")
        MessageView(message: "메시지입니다.")
    }
}

#Preview {
    SubViewStructExample()
}
