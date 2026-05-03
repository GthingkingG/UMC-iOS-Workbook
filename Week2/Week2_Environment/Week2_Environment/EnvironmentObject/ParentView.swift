//
//  ParentView.swift
//  Week2_Environment
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct ParentView: View {
    @StateObject var userViewModel: UserViewModel = .init()

    
    var body: some View {
        NavigationStack {
            VStack {
                Text("현재 사용자: \(userViewModel.username)")
                    .font(.title)
                
                NavigationLink(
                    "프로필 화면으로 이동",
                    destination: ProfileView().environmentObject(userViewModel)
                )
                NavigationLink("설정 화면으로 이동",
                               destination: SettingView().environmentObject(userViewModel)
                )
            }
        }
    }
}

#Preview {
    ParentView()
}
