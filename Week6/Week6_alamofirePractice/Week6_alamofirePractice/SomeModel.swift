//
//  SomeModel.swift
//  Week6_alamofirePractice
//
//  Created by Air on 7/6/25.
//
import Foundation
import Alamofire

struct SomeModel: Codable {
    let id: Int
    let name: String
}

func fetchData() async {
    do {
        let response = try await AF.request("https://localhost:8080/person")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .serializingDecodable(SomeModel.self)
            .value
        print("성공:", response)
    } catch {
        print("오류:", error.localizedDescription)
    }
}

func uploadProfile(name: String, fileURL: URL) async {
    do {
        let response = try await AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(Data(name.utf8), withName: "name")
                multipartFormData.append(fileURL, withName: "profileImage", fileName: "profile.jpg", mimeType: "image/jpeg")
            },
            to: "https://localhost:8080/person"
        )
        .validate()
        .serializingString()
        .value
        
        print("파일 업로드 성공:", response)
    } catch {
        print("파일 업로드 실패:", error.localizedDescription)
    }
}

final class ResponseQueueExample {
    private let session: Session
    
    init() {
        let backgroundQueue = DispatchQueue(label: "com.One.responseQueue")
        
        self.session = Session(rootQueue: backgroundQueue)
    }
    
    func sendRequest() {
        session.request("http://localhost:8080/person")
            .validate()
            .responseDecodable(of: SomeModel.self) { response in
                print("백그라운드 큐에서 응답 처리됨")
                
                switch response.result {
                case .success(let model):
                    DispatchQueue.main.async {
                        print("메인 스레드에서 모델 사용: \(model)")
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print("오류 발생: \(error.localizedDescription)")
                    }
                }
            }
    }
}
