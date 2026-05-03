//
//  SubViewExample.swift
//  Week1_StackView
//
//  Created by Air on 5/9/25.
//

import SwiftUI

struct SubViewExample: View {
    var body: some View {
        VStack {
            headerView
            
            SubHeaderView()
            
            messageView
            
            actionButton
        }
    }
    
    private var headerView: some View {
        Text("hello swiftUI")
            .font(.title)
            .foregroundStyle(Color.red)
    }
    
    private var messageView: some View {
        Text("이제 하위 뷰를 만들어보자")
            .font(.title)
            .foregroundStyle(Color.gray)
    }
    
    private var actionButton: some View {
        Button(action: {
            print("버튼 클릭")
        }, label: {
            Text("Click")
        })
    }
    
}

struct SubHeaderView: View {
    var body: some View {
        Text("Hi, world")
            .font(.subheadline)
            .foregroundStyle(Color.orange)
    }
}

#Preview {
    SubViewExample()
}
