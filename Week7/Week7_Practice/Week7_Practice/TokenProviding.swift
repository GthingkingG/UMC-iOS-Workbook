//
//  TokenProviding.swift
//  Week7_Practice
//
//  Created by Air on 7/21/25.
//

import Foundation

protocol TokenProviding {
    var accessToken: String? { get set }
    func refreshToken(completion: @escaping (String?, Error?) -> Void)
}
