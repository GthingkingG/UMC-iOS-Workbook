//
//  ISBNScannerViewModel.swift
//  Week6_Practice
//
//  Created by Air on 7/8/25.
//

import Foundation
import SwiftUI
import Alamofire

@Observable
class ISBNScannerViewModel {
    
    var bookModel: BookModel.Documnets?
    var errorMessage: String?
    var isShowSaveView: Bool = false
    
    func searchBook(isbn: String) async {
        self.errorMessage = nil
        
        do {
            let result = try await KakaoAPIService.shared.searchBook(query: isbn)
            self.bookModel = result.documents.first
            self.isShowSaveView = true
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    public func pruchaseBook() {
        if let urlString = self.bookModel?.url,
           let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("구매 링크 연결 X")
        }
    }
}
