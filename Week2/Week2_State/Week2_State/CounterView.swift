//
//  CounterView.swift
//  Week2_State
//
//  Created by Air on 5/16/25.
//

import SwiftUI

struct CounterView: View {
    @State private var isCliked: Bool = false
    
    var body: some View {
        Text("현재 State 변수 값: \(isCliked)")
        
        CustomView(isCliked: $isCliked)
    }
}

#Preview {
    CounterView()
}
