//
//  tempView.swift
//  Week2_Practice
//
//  Created by Air on 5/21/25.
//

import SwiftUI

struct tempView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue, lineWidth: 1)
                .frame(width: 140, height: 120)
                .foregroundStyle(Color.white)
            Text("Button")
        }
        
        Spacer().frame(height: 60)
        
        Text("Button")
            .padding(50)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 1)
            })
    }
}

#Preview {
    tempView()
}
