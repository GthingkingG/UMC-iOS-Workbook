//
//  RedirectHandlerExample.swift
//  Week6_alamofirePractice
//
//  Created by Air on 7/7/25.
//

import Foundation
import Alamofire

class RedirectHandlerExample {
    private let session: Session
    
    init() {
        let redirector = Redirector(behavior: .doNotFollow)
        
        self.session = Session(redirectHandler: redirector)
    }
    
    func sendRequest() {
        session.request("http://localhost:8080/person")
            .response { response in
                if let httpResponse = response.response {
                    print("리다이렉트 차단됨:", httpResponse.statusCode)
                } else if let error = response.error {
                    print("요청 실패:", error.localizedDescription)
                } else {
                    print("응답 수신 완료")
                }
            }
    }
}
