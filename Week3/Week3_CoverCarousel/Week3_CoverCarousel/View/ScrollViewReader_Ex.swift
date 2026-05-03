//
//  ScrollViewReader_Ex.swift
//  Week3_CoverCarousel
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ScrollViewReader_Ex: View {
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
                .onChange(of: scrollToIndex) { oldIndex, newIndex in
                    withAnimation {
                        proxy.scrollTo(newIndex, anchor: .top)
                    }
                }
            }
            HStack {
                Button("Top") { scrollToIndex = 0 }
                Button("Middle") { scrollToIndex = 25 }
                Button("Bottom") { scrollToIndex = 49 }
            }
        }
    }
}

#Preview {
    ScrollViewReader_Ex()
}
