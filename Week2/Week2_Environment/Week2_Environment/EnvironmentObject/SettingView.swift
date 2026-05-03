//
//  SettingView.swift
//  Week2_Environment
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("설정 화면")
                .font(.largeTitle)
            
            TextField("사용자 이름 변경", text: $userViewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    SettingView()
        .environmentObject(UserViewModel())
}
