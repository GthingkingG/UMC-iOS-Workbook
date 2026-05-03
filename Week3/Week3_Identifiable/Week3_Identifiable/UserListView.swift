//
//  UserListView.swift
//  Week3_Identifiable
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct UserListView: View {
    @State private var users = [
        User(name: "Alice", age: 24),
        User(name: "Bob", age: 30),
        User(name: "Charlie", age: 28)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach($users) { $user in
                    NavigationLink(destination: UserEditView(user: $user)) {
                        HStack {
                            Text(user.name)
                            Spacer()
                            Text("\(user.age) years  old")
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UserListView()
}
