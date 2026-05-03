//
//  GeometryReader_Ex.swift
//  Week3_CoverCarousel
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct GeometryReader_Ex: View {
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Offset: \(Int(scrollOffset))")
                .font(.headline)
            
            ScrollView {
                LazyVStack {
                    ForEach(0..<50, id: \.self) { index in
                        Text("Item: \(index)")
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.3))
                    }
                }
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                scrollOffset = proxy.frame(in: .global).minY
                            }
                            .onChange(of: proxy.frame(in: .global).minY) { oldValue, newValue in
                                scrollOffset = newValue
                            }
                    }
                )
            }
        }
    }
}

#Preview {
    GeometryReader_Ex()
}
