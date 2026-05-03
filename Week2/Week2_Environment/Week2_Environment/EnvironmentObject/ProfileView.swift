//
//  ProfileView.swift
//  Week2_Environment
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("프로필 화면")
                .font(.largeTitle)
            Text("사용자 이름: \(userViewModel.username)")
                .font(.title)
            Button("이름 변경") {
                userViewModel.username = "새로운 사용자"
            }
            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(UserViewModel())
}
