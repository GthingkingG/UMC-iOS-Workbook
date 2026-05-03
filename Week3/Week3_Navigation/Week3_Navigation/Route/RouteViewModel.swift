//
//  RouteViewModel.swift
//  Week3_Navigation
//
//  Created by Air on 5/24/25.
//

import SwiftUI
import Observation

@Observable
class NavigationRouter {
    var path = NavigationPath()
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path = NavigationPath()
    }
}
