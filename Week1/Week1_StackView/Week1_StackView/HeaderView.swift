//
//  HeaderView.swift
//  Week1_StackView
//
//  Created by Air on 5/9/25.
//

import SwiftUI

struct HeaderView: View {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundStyle(Color.red)
            .font(.largeTitle)
    }
}
