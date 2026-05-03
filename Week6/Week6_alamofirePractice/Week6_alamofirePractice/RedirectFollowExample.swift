//
//  RedirectFollowExample.swift
//  Week6_alamofirePractice
//
//  Created by Air on 7/7/25.
//

import Foundation
import Alamofire

final class RedirectFollowExample {
    private let session: Session
    
    init() {
        let redirector = Redirector(behavior: .follow)
        self.session = Session(redirectHandler: redirector)
    }
    
    func sendRequest() {
        session.request("http://localhost:8080/person")
            .response { response in
                if let httpResponse = response.response {
                    print("리다이렉트 허용됨:", httpResponse.statusCode)
                } else {
                    print("응답 없음")
                }
            }
    }
}
