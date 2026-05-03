//
//  ContentView.swift
//  Week2_State
//
//  Created by Air on 5/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("키운트: \(count)")
                    .font(.largeTitle)
            }
            
            Button("증가") {
                count += 1
            }
            
            VStack {
                Text("텍스트 내용: \(text)")
                    .font(.largeTitle)
                
                TextField("아무 값을 입력해보세요!", text: $text)
                    .frame(width: 350)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
