//
//  UserListView_2.swift
//  Week3_Identifiable
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct UserListView_2: View {
    @State private var userViewModel: UserViewModel = .init()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(userViewModel.users.indices, id: \.self) { index in
                    NavigationLink(destination: UserEditView(user: $userViewModel.users[index])) {
                        HStack {
                            Text(userViewModel.users[index].name)
                            Spacer()
                            Text("\(userViewModel.users[index].age) years old")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    UserListView_2()
}
