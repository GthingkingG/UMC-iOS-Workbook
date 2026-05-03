//
//  ReturnExample.swift
//  Week1_StackView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct ReturnExample: View {
    @State var isLoggedIn: Bool = false
    
    func login() {
        isLoggedIn = true
    }
    
    var body: some View {
        
        if isLoggedIn {
            someView()
        } else {
            anyView()
        }
    }
    
    @ViewBuilder
    func someView() -> some View {
        VStack {
            Text("환영합니다!")
                .font(.title)
            Text("SwiftUI 앱에 로그인되었습니다.")
        }
    }
    
    @ViewBuilder
    func anyView() -> some View {
        VStack {
            Button(action: login) {
                Text("Login")
            }
            Text("로그인이 필요합니다.")
                .font(.title)
            Text("로그인하기")
            
            
        }
    }
    
    @ViewBuilder
    private func testView() -> some View {
        Spacer()
        Text("11")
        Text("22")
    }
}

#Preview {
    ReturnExample()
}
