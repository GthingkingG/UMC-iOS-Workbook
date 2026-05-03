//
//  ContentView.swift
//  Week1_LabelView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("레이블을 클릭했습니다.")
        }, label: {
            Label(title: {
                Text("레이블 내부 텍스트입니다.")
            }, icon: {
                Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                    .imageScale(.large)
            })
            .labelStyle(.titleAndIcon) //레이블 스타일 지정(제목만, 아이콘만, 자동, 제목과 아이콘)
        })
    }
}

#Preview {
    ContentView()
}
