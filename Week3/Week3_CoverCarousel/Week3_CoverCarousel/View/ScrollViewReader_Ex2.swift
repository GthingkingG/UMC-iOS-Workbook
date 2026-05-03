//
//  ScrollViewReader_Ex2.swift
//  Week3_CoverCarousel
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ScrollViewReader_Ex2: View {
    @State private var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        ForEach(0..<50, id: \.self) { index in
                            Text("Item \(index)")
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.3))
                                .id(index)
                                .padding()
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            proxy.scrollTo(25, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReader_Ex2()
}
