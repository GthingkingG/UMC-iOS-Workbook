//
//  onSubmit_Ex4.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onSubmit_Ex4: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("아이디", text: $username)
                .textFieldStyle(.roundedBorder)
            
            SecureField("비밀번호", text: $password)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    login()
                }
            Button("로그인", action: login)
        }
        .padding()
    }
    
    func login() {
        guard !username.isEmpty, !password.isEmpty else {
            print("아이디와 비밀번호를 입력하세요.")
            return
        }
        print("로그인 시도: \(username), \(password)")
    }
}

#Preview {
    onSubmit_Ex4()
}
