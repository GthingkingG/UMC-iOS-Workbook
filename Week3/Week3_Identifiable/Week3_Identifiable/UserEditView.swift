//
//  UserEditView.swift
//  Week3_Identifiable
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct UserEditView: View {
    @Binding var user: User
    
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            Stepper("Age: \(user.age)", value: $user.age, in: 18...100)
        }
    }
}
