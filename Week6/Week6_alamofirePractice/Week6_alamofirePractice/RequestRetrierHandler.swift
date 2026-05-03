//
//  RequestRetrierHandler.swift
//  Week6_alamofirePractice
//
//  Created by Air on 7/6/25.
//

import Foundation
import Alamofire

protocol TokenProviding {
    var accessToken: String? { get }
}

final class RequestRetrierHandler: RequestInterceptor {
    private let tokenProviding: TokenProviding
    
    init(tokenProviding: TokenProviding) {
        self.tokenProviding = tokenProviding
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        if let accessToken = tokenProviding.accessToken {
            urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            print("401 에러, 재시도 수행")
            completion(.retry)
        } else {
            completion(.doNotRetry)
        }
    }
}
