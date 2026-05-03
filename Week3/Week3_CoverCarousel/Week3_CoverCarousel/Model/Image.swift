//
//  Image.swift
//  Week3_CoverCarousel
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ImageModel: Identifiable {
    var id: UUID = .init()
    var image: String
    var text: String
}

var images: [ImageModel] = (1...8).compactMap({ ImageModel(image: "Profile \($0)", text: "\($0)") })
