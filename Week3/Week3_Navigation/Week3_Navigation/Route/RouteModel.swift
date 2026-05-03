//
//  RouteModel.swift
//  Week3_Navigation
//
//  Created by Air on 5/24/25.
//

import SwiftUI

enum Route: Hashable {
    case home
    case detail(title: String)
    case profile(userID: Int)
}
