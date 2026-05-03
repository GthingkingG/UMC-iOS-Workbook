//
//  TokenProviding.swift
//  Week7_Contetn
//
//  Created by Air on 8/2/25.
//

import Foundation

protocol TokenProviding {
    var accessToken: String? { get set }
    func refreshToken(completion: @escaping (String?, Error?) -> Void)
}
