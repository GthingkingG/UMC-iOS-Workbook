//
//  onDisappear_Ex3.swift
//  Week2_Extra
//
//  Created by Air on 5/19/25.
//

import SwiftUI

struct onDisappear_Ex3: View {
    var body: some View {
        Text("로그아웃 화면")
            .onDisappear {
                saveUserData()
            }
    }
    func saveUserData() {
        print("사용자 데이터 저장 완료")
    }
}

#Preview {
    onDisappear_Ex3()
}
