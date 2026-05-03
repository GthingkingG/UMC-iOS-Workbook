//
//  SSL.swift
//  Week6_alamofirePractice
//
//  Created by Air on 7/7/25.
//

import Foundation
import Alamofire

class SSL {
    private let session: Session
    
    init() {
        let evaluators: [String: ServerTrustEvaluating] = [
            "example.com": PinnedCertificatesTrustEvaluator()
        ]
        let trustManager = ServerTrustManager(evaluators: evaluators)
        self.session = Session(serverTrustManager: trustManager)
    }
    
    func sendRequest() {
        session.request("http://localhost:8080/person")
            .validate()
            .response { response in
                print("보안 검증된 응답")
            }
    }
}
