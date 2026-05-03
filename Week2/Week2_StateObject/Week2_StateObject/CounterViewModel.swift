//
//  CounterViewModel.swift
//  Week2_StateObject
//
//  Created by Air on 5/16/25.
//

import SwiftUI

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
}
