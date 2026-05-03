//
//  Credential.swift
//  Week6_alamofirePractice
//
//  Created by Air on 7/7/25.
//

import Foundation
import Alamofire

struct Credential: AuthenticationCredential {
    let accessToken: String
    let expiration: Date
    
    var requiresRefresh: Bool {
        return Date(timeIntervalSinceNow: 60 * 5) > expiration
    }
}
