//
//  ContentsViewModel.swift
//  Week7_Temp
//
//  Created by Air on 8/4/25.
//

import Foundation
import Moya

@Observable
class ContentsViewModel {
    
    //MARK: 플러그인 이용해서 로거 출력
    var userData: UserData?
    var listData: ListData?
    let provider: MoyaProvider<UserRouter>
    
    init() {
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.verbose]))
        self.provider = MoyaProvider<UserRouter>(plugins: [logger])
    }
    
    func getRouteData(departure: String, arrival: String) {
        provider.request(.getRoute(departure: departure, arrival: arrival), completion: { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(UserData.self, from: response.data)
                    self?.userData = decodedData
                } catch {
                    print("유저 데이터 디코더 오류", error)
                }
            case .failure(let error):
                print("error", error)
            }
        })
    }
    
    func getListData(query: String) {
        provider.request(.getList(query: query), completion: { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(ListData.self, from: response.data)
                    self?.listData = decodedData
                } catch {
                    print("응답 데이터 디코더 오류", error)
                }
            case .failure(let error):
                print("error", error)
            }
        })
    }
    
    func printList() {
        if let data = self.listData {
            for item in data.documents {
                print("\(item.place) -- \(item.address)")
            }
        }
    }
}
