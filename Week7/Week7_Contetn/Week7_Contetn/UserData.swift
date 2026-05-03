//
//  UserData.swift
//  Week7_Contetn
//
//  Created by Air on 8/2/25.
//

import Foundation

struct UserData: Codable {
    let name: String
    let age: Int
    let address: String
    let height: Double
}

struct UserPatchRequest: Codable {
    let name: String?
    let age: Int?
    let address: String?
    let height: Double?
}
