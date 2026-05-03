//
//  Week4_ExtraApp.swift
//  Week4_Extra
//
//  Created by Air on 6/19/25.
//

import SwiftUI
import SwiftData

@main
struct Week4_ExtraApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
