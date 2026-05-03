//
//  Task.swift
//  Week4_Extra
//
//  Created by Air on 6/19/25.
//

import Foundation
import SwiftData

@Model
class Task {
    @Attribute(.unique) var title: String
    var isDone: Bool
    var createdAt: Date
    
    @Transient var isBeingEdited: Bool = false
    
    init(title: String, isDone: Bool = false, createdAt: Date = .now) {
        self.title = title
        self.isDone = isDone
        self.createdAt = createdAt
    }
}
