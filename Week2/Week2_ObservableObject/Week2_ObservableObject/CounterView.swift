//
//  CounterView.swift
//  Week2_ObservableObject
//
//  Created by Air on 5/16/25.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel = .init()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
            
            Button(action: {
                viewModel.count += 1
            }, label: {
                Text("카운트 증가 버튼")
            })
        }
    }
}

#Preview {
    CounterView()
}
