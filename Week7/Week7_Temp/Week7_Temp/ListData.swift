//
//  ListData.swift
//  Week7_Temp
//
//  Created by Air on 8/6/25.
//

import Foundation

struct ListData: Codable {
    let documents: [Document]
}

struct Document: Codable {
    let place: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case place = "place_name"
        case address = "address_name"
    }
}
