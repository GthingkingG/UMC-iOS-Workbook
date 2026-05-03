//
//  UserModel.swift
//  Week3_Identifiable
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
}
