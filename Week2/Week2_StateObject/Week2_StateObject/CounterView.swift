//
//  CounterView.swift
//  Week2_StateObject
//
//  Created by Air on 5/16/25.
//

import SwiftUI

struct CounterView: View {
    @StateObject var ViewModel: CounterViewModel = .init()
    
    var body: some View {
        VStack {
            Text("\(ViewModel.count)")
            
            Button(action: {
                ViewModel.count += 1
            }, label: {
                Text("카운트 증가 버튼")
            })
        }
    }
}

#Preview {
    CounterView()
}
