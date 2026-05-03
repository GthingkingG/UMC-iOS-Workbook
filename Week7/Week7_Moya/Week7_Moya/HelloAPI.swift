//
//  HelloAPI.swift
//  Week7_Moya
//
//  Created by Air on 7/20/25.
//

import Foundation
import Moya

enum HelloAPI {
    case hello
}

extension HelloAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.example.com")!
        
    }
    
    var path: String {
        return "/hello"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        return "{\"message\": \"Hello, world!\"}".data(using: .utf8)!
    }
}

protocol BaseTarget: TargetType {}

extension BaseTarget {
    var baseURL: URL {
        return URL(string: "https://example.com")!
    }
    
    var headers: [String : String]? {
        switch task {
        case .requestJSONEncodable, .requestParameters:
            return ["Content-Type": "application/json"]
        case .uploadMultipart:
            return ["Content-Type": "multipart/form-data"]
        default:
            return nil
        }
    }
}

enum AuthAPI {
    case login(email: String, password: String)
    case signup(name: String, email: String, password: String)
}

//extension AuthAPI: BaseTarget {
//    var path: String {
//        return ""
//    }
//    var method: Moya.Method {}
//    var task: Task {}
//    var headers: [String : String]? {}
//    var sampleData: Data {}
//}
//
//let provider = MoyaProvider<HelloAPI>()
//
//provider.request(.hello) { result in
//    switch result {
//    case .success(let response):
//        do {
//            let json = try JSONSerialization.jsonObject(with: response.data, options: [])
//            print("응답 성공:", json)
//        } catch {
//            print("파실 실패:", error)
//        }
//    case .failure(let error):
//        print("요청 실패:", error)
//    }
//}
//
//provider.request(.hello) { result in
//    switch result {
//    case .success(let response):
//        do {
//            let decoded = try JSONDecoder().decode(Data.self, from: response.data)
//            print("응답 성공:", decoded)
//        } catch {
//            print("파싱 실패:", error)
//        }
//    case .failure(let error):
//        print("요청 실패:", error)
//    }
//}

protocol PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest
    func willSend(_ request: RequestType, target: TargetType)
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType)
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError>
}

final class DebugPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        print("[prepare] 요청 준비 중: \(request.url?.absoluteString ?? "")")
        return request
    }
    
    func willSend(_ request: any RequestType, target: TargetType) {
        print("[willSend] 요청 시작: \(request.request?.url?.absoluteString ?? "")")
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            print("[didReceive] 응답 성공: \(response.statusCode)")
        case .failure(let error):
            print("[didReceive] 응답 실패: \(error.localizedDescription)")
        }
    }
    
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        print("[process] 응답 후처리 중")
        return result
    }
}

//class Test {
//    let provider: MoyaProvider<UserRouter>
//    
//    init() {
//        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
//        self.provider = MoyaProvider<UserRouter>(plugins: [logger])
//    }
//}
//let stubProvider = MoyaProvider<HelloAPI>(stubClosure: MoyaProvider.immediatelyStub)
//
//stubProvider.request(.hello) { result in
//    if case let .success(response) = result {
//        print("샘플 응답:", String(data: response.data, encoding: .utf8) ?? "")
//    }
////}
//
extension MoyaProvider {
    func requestAsync(_ target: Target) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
