//
//  BottomView.swift
//  Week2_StateObject
//
//  Created by Air on 5/17/25.
//

import SwiftUI

struct BottomView: View {
    @ObservedObject var viewModel: TextViewModel //StateObject는 뷰 당 한 번만 초기화되는 특성을 갖고 있어서 오류 발생 => ObservedObject로 변경
    
    init(viewModel: TextViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("하위 뷰 입니다.")
        Text("현재 입력된 값: \(viewModel.inputText)")
        Button("강제 초기화") {
            viewModel.inputText = "초기화됨"
        }
        Spacer()
    }
}
