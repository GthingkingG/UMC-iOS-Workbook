//
//  onChange_Ex2.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onChange_Ex2: View {
    @State private var query = ""
    @State private var results: [String] = []
    
    var body: some View {
        VStack {
            TextField("검색어 입력", text: $query)
                .onChange(of: query) { oldValue, newQuery in
                    fetchResults(for: newQuery)
                }
            
            List(results, id: \.self) { result in
                Text(result)
            }
        }
    }
    
    func fetchResults(for query: String) {
        guard !query.isEmpty else { return }
        print("'\(query)'에 대한 검색 실행")
    }
}

#Preview {
    onChange_Ex2()
}
