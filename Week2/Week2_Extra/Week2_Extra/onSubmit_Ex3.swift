//
//  onSubmit_Ex3.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onSubmit_Ex3: View {
    @State private var query = ""
    
    var body: some View {
        TextField("검색어 입력", text: $query)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
                search()
            }
    }
    
    func search() {
        guard !query.isEmpty else { return }
        print("검색 실행: \(query)")
    }
}

#Preview {
    onSubmit_Ex3()
}
