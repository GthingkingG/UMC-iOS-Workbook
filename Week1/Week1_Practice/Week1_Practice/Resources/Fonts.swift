//
//  Fonts.swift
//  Week1_Practice
//
//  Created by Air on 5/9/25.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretend {
        case extraBold
        case bold
        case semiBold
        case medium
        case regular
        case light
        
        var value: String {
            switch self {
            case .extraBold:
                return "ts(:xtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semiBold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            }
        }
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static var PretendardBold30: Font {
        return .pretend(type: .bold, size: 30)
    }
    
    static var PretendardLight16: Font {
        return .pretend(type: .light, size: 16)
    }
    
    static var PretendardBold24: Font {
        return .pretend(type: .bold, size: 24)
    }
    
    static var PretendardSemiBold18: Font {
        return .pretend(type: .semiBold, size: 18)
    }
}
