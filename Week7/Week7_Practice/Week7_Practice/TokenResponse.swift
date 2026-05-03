//
//  TokenResponse.swift
//  Week7_Practice
//
//  Created by Air on 7/21/25.
//

import Foundation

struct TokenResponse: Codable {
    var accessToken: String
    var refreshToken: String
}
