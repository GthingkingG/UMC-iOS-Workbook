//
//  BookModel.swift
//  Week6_Practice
//
//  Created by Air on 7/8/25.
//

import Foundation

struct BookModel: Codable {
    let documents: [Documnets]
    let meta: Meta
    
    //MARK: META
    struct Meta: Codable {
        let isEnd: Bool?
        let pageableCount: Int?
        let totalCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case isEnd = "is_end"
            case pageableCount = "pageable_count"
            case totalCount = "total_count"
        }
    }
    
    //MARK: DOCUMENTS
    struct Documnets: Codable {
        let authors: [String]
        let contents: String
        let datetime: String
        let isbn: String
        let price: Int
        let publisher: String
        let salePrice: Int?
        let status: String
        let thumbnail: String
        let title: String
        let translators: [String]
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case authors, contents, datetime, isbn, price, publisher
            case salePrice = "sale_price"
            case status, thumbnail, title, translators, url
        }
    }
}
