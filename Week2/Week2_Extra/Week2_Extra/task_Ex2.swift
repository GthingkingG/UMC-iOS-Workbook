//
//  task_Ex2.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct task_Ex2: View {
    @State private var data: String = "로딩 중...."
    
    var body: some View {
        Text(data)
            .task {
                fetchData()
            }
    }
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            data = "데이터 로드 완료"
        }
    }
}

#Preview {
    task_Ex2()
}
