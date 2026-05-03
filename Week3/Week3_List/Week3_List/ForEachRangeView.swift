//
//  ForEachRangeView.swift
//  Week3_List
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ForEachRangeView: View {
    var body: some View {
        VStack {
            ForEach(1..<6) { index in
                Text("항목 \(index)")
                    .font(.headline)
            }
        }
    }
}

struct ForEachRangeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachRangeView()
    }
}
