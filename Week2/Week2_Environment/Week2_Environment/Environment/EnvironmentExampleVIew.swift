//
//  EnvironmentExampleVIew.swift
//  Week2_Environment
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct EnvironmentExampleVIew: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text("현재 색상 모드: \(colorScheme == .dark ? "다크모드" : "라이트모드")")
                .padding()
                .background(colorScheme == .dark ? Color.black : Color.white)
                .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
        }
    }
}

#Preview {
    EnvironmentExampleVIew()
}
