//
//  SpacerExample.swift
//  Week1_StackView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct SpacerExample: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("첫 번째 요소")
                .font(.title)
            
            Spacer()
            
            Text("두 번째 요소")
                .font(.headline)
            
            Spacer()
            
            Text("세 번째 요소")
                .font(.subheadline)
        }
        
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: "star.fill")
            
            Spacer().frame(width: 100) //별과 즐겨찾기 중간에 있는 공간의 크기를 100으로 제한
            
            Text("즐겨찾기")
                .font(.headline)
                .padding()
                .border(Color.blue, width: 1)
        }
    }
}

#Preview {
    SpacerExample()
}
