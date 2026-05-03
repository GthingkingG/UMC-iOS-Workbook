//
//  TokenProvider.swift
//  Week7_Contetn
//
//  Created by Air on 8/2/25.
//

import Foundation
import Moya

class TokenProvider: TokenProviding {
    private let userSession = "appNameUser"
    private let keyChain = KeychainManager.standard
    private let provider = MoyaProvider<AuthRouter>()
    
    var accessToken: String? {
        get {
            guard let userInfo = keyChain.loadSession(for: userSession) else { return nil }
            return userInfo.accessToken
        }
        set {
            guard var userInfo = keyChain.loadSession(for: userSession) else { return }
            userInfo.accessToken = newValue
            if keyChain.saveSession(userInfo, for: userSession) {
                print("유저 엑세스 토큰 갱신됨: \(String(describing: newValue))")
            }
        }
    }
    
    var refresToken: String? {
        get {
            guard let userInfo = keyChain.loadSession(for: userSession) else { return nil }
            return userInfo.refreshToken
        }
        
        set {
            guard var userInfo = keyChain.loadSession(for: userSession) else { return }
            userInfo.refreshToken = newValue
            if keyChain.saveSession(userInfo, for: userSession) {
                print("유저 리프레시 갱신됨")
            }
        }
    }
    
    func refreshToken(completion: @escaping (String?, (any Error)?) -> Void) {
        guard let userInfo = keyChain.loadSession(for: userSession), let refreshToken = userInfo.refreshToken else {
            let error = NSError(domain: "http://localhost:8080", code: -1, userInfo: [NSLocalizedDescriptionKey: "UserSession or refreshToken not found"])
            completion(nil, error)
            return
        }
        
        provider.request(.sendRefreshToken(refreshToken: refreshToken)) { result in
            switch result {
            case .success(let response):
                if let jsonString = String(data: response.data, encoding: .utf8) {
                    print("응답 JSON: \(jsonString)")
                } else {
                    print("JSON 데이터를 문자열로 변환할 수 없습니다.")
                }
                
                do {
                    let tokenData = try JSONDecoder().decode(TokenResponse.self, from: response.data)
                    self.accessToken = tokenData.accessToken
                    self.refresToken = tokenData.refreshToken
                    completion(self.accessToken, nil)
                } catch {
                    print("디코딩 에러: \(error)")
                    completion(nil, error)
                }
            case .failure(let error):
                print("네트워크 에러: \(error)")
                completion(nil, error)
            }
        }
    }
}
