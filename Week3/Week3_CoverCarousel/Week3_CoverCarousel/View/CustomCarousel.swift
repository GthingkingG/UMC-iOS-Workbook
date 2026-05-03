//
//  CustomCarousel.swift
//  Week3_CoverCarousel
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct CustomCarousel<Content: View, Data: RandomAccessCollection>: View where Data.Element: Identifiable {
    var config: Config
    @Binding var selection: Data.Element.ID?
    var data: Data
    @ViewBuilder var content: (Data.Element) -> Content
    @Binding var text: String
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            ScrollView(.horizontal) {
                HStack(spacing: config.spacing) {
                    ForEach(data) { item in
                       ItemView(item)
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal, max((size.width - config.cardWidth) / 2, 0))
            .scrollPosition(id: $selection)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .searchable(text: $text)
            .contentMargins(.bottom, 45, for: .scrollIndicators)
        }
        
    }
    @ViewBuilder
    func ItemView(_ item: Data.Element) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
            let progress = minX / (config.cardWidth + config.spacing)
            let minimumCardWidth = config.minimumCardWidth
            
            let diffwidth = config.cardWidth - minimumCardWidth
            let reducingWidth = progress * diffwidth
            
            let cappedWidth = min(reducingWidth, diffwidth)
            
            let resizedFrameWidth = size.width - (minX > 0 ? cappedWidth : min(-cappedWidth, diffwidth))
            let negativeProgress = max(-progress, 0)
            
            let scaleValue = config.scaleValue * abs(progress)
            let opacityValue = config.opacityValue * abs(progress)
            
            content(item)
                .frame(width: size.width, height: size.height)
                .frame(width: resizedFrameWidth)
                .opacity(config.hasOpacity ? 1 - opacityValue : 1)
                .scaleEffect(config.hasScale ? 1 - scaleValue : 1)
                .mask {
                    let hasScale = config.hasScale
                    let scaleHeight = (1 - scaleValue) * size.height
                    RoundedRectangle(cornerRadius: config.cornerRadius)
                        .frame(height: hasScale ? max(scaleHeight, 0) : size.height)
                }
                .offset(x: -reducingWidth)
                .offset(x: min(progress, 1) * diffwidth)
                .offset(x: negativeProgress * diffwidth)
        }
        .frame(width: config.cardWidth)
    }
    
    struct Config {
        var hasOpacity: Bool = false
        var opacityValue: CGFloat = 0.4
        var hasScale: Bool = false
        var scaleValue: CGFloat = 0.2
        
        var cardWidth: CGFloat = 150
        var spacing: CGFloat = 10
        var cornerRadius: CGFloat = 15
        var minimumCardWidth: CGFloat = 40
    }
}
