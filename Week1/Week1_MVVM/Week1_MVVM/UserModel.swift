//
//  UserModel.swift
//  Week1_MVVM
//
//  Created by Air on 5/8/25.
//

import Foundation

struct UserModel {
    var name: String
    var age: Int
    
    mutating func increaseAge() {
        self.age += 1
    }
    
    mutating func decreaseAge() {
        self.age -= 1
    }
}
