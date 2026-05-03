//
//  ProfileView.swift
//  Week3_Navigation
//
//  Created by Air on 5/25/25.
//

import SwiftUI

struct ProfileView: View {
    let userID: Int
    
    var body: some View {
        VStack {
            Text("User ID: \(userID)")
                .font(.largeTitle)
        }
        .navigationTitle("Profile")
    }
}

