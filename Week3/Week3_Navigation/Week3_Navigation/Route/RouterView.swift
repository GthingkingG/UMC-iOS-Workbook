//
//  RouterView.swift
//  Week3_Navigation
//
//  Created by Air on 5/24/25.
//

import SwiftUI

struct RouterView: View {
    @State private var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Button("Go to Home") {
                    router.push(.home)
                }
                
                Button("Go to Detail") {
                    router.push(.detail(title: "SwiftUI Navigation"))
                }
                
                Button("Go to Profile") {
                    router.push(.profile(userID: 123))
                }
                
                Button("Reset Navigation") {
                    router.reset()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .home:
                    HomeView()
                case .detail(let title):
                    DedetailView(title: title)
                case .profile(let userID):
                    ProfileView(userID: userID)
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    RouterView()
}
