//
//  ChildView.swift
//  Observable
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct ChildView: View {
    @Bindable var counter: Counter
    
    var body: some View {
        Button("Child Increment") {
            counter.count += 1
        }
    }
}
