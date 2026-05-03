//
//  TokenResponse.swift
//  Week7_Contetn
//
//  Created by Air on 8/2/25.
//

import Foundation

struct TokenResponse: Codable {
    var accessToken: String
    var refreshToken: String
}
