//
//  StackViews.swift
//  Week1_StackView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct StackViews: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                Text("사용자 이름")
            }
            .padding()
            
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 300, height: 150)
                Text("ZStack 내부")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    StackViews()
}
