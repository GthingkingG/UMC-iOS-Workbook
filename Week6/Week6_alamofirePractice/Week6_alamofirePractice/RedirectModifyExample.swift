//
//  RedirectModifyExample.swift
//  Week6_alamofirePractice
//
//  Created by Air on 7/7/25.
//

import Foundation
import Alamofire

final class RedirectModifyExample {
    private let session: Session
    
    init() {
        let redirector = Redirector(behavior: .modify { task, request, response in
            var modifiedRequest = request
            modifiedRequest.setValue("Bearer token123", forHTTPHeaderField: "Authorization")
            print("리다이렉트 수정됨, 토큰 포함")
            return modifiedRequest
        })
        
        self.session = Session(redirectHandler: redirector)
    }
    
    func sendRequest() {
        session.request("http://localhost:8080/person")
            .response { response in
                if let httpResponse = response.response {
                    print("리다이렉트 후 응답 수신:", httpResponse.statusCode)
                } else if let error = response.error {
                    print("에러 발생:", error.localizedDescription)
                } else {
                    print("응답 없음")
                }
            }
    }
}
