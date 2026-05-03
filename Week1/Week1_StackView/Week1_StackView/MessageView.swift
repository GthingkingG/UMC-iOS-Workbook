//
//  MessageView.swift
//  Week1_StackView
//
//  Created by Air on 5/9/25.
//

import SwiftUI

struct MessageView: View {
    let message: String
    
    init(message: String) {
        self.message = message
    }
    
    var body: some View {
        Text(message)
            .font(.title)
            .foregroundStyle(Color.green)
    }
}
