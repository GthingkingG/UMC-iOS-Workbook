//
//  onDisappear_Ex2.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onDisappear_Ex2: View {
    @State private var task: Task<(), Never>? = nil
    
    var body: some View {
        Text("데이터 로딩 중....")
            .onAppear {
                task = Task {
                    await networkData()
                }
            }
            .onDisappear {
                task?.cancel()
            }
    }
    
    func networkData() async {
        do {
            try await Task.sleep(nanoseconds: 5_000_000_000)
            print("데이터 로드 완료")
        } catch {
            print("작업이 취소되었습니다.")
        }
    }
}

#Preview {
    onDisappear_Ex2()
}
