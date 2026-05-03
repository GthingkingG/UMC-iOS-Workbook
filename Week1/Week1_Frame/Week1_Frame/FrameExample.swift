//
//  FrameExample.swift
//  Week1_Frame
//
//  Created by Air on 5/9/25.
//

import SwiftUI

struct FrameExample: View {
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(maxHeight: .infinity)
    }
}

#Preview {
    FrameExample()
}
