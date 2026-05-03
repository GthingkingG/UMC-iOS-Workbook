//
//  DedetailView.swift
//  Week3_Navigation
//
//  Created by Air on 5/25/25.
//

import SwiftUI

struct DedetailView: View {
    let title: String
    
    var body: some View {
        VStack {
            Text("This is \(title) View")
                .font(.largeTitle)
        }
        .navigationTitle(title)
    }
}
