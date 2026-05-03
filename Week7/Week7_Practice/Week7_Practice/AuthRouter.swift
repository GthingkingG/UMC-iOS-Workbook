//
//  AuthRouter.swift
//  Week7_Practice
//
//  Created by Air on 7/21/25.
//

import Foundation
import Moya
import SwiftUI

enum AuthRouter {
    case sendRefreshToken(refreshToken: String)
    case login
}

extension AuthRouter: APITargetType {
    var path: String {
        switch self {
        case .sendRefreshToken:
            return "/member/reissue"
        case .login:
            return "/auth/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .sendRefreshToken, .login:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .sendRefreshToken(let refreshToken):
            return .requestParameters(parameters: ["refreshToken": refreshToken], encoding: URLEncoding.queryString)
        case .login:
            return .requestPlain
        }
    }
    
//    var headers: [String : String]? {
//        switch self {
//        case .sendRefreshToken(let refresh):
//            var headers = ["Content-Type": "application/json"]
//            headers["Refresh-Token"] = "\(refresh)"
//            
//            return headers
//        }
//    }
}
