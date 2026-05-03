//
//  UserViewModel.swift
//  UMC-iOS-Workbook
//
//  Created by Air on 5/7/25.
//

import SwiftUI

class UserViewModel: ObservableObject {
    var userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
}

