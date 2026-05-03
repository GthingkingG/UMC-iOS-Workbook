//
//  UserViewModel.swift
//  Week1_MVVM
//
//  Created by Air on 5/8/25.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    func increaseAge() {
        self.userModel.increaseAge()
    }
    
    func decreaseAge() {
        self.userModel.decreaseAge()
    }
}
