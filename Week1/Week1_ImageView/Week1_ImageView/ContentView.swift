//
//  ContentView.swift
//  Week1_ImageView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "eraser.fill")
            .resizable() //이미지 크기를 조정 가능하도록
            .frame(width: 300, height: 300) //이미지 너비와 높이를 300으로 설정
            .aspectRatio(contentMode: .fit) //.fit은 원본 이미지의 비율을 유지하면서 이미지의 크기를 맞춘다. .fill은 원본 이미지의 비율을 유지하면서 이미지를 가능한 크게 확대한다. 이 수정자를 사용하지 않으면, 이미지의 크기가 비율에 상관없이 가장 크게 확대된다.
            .background() {
                Circle()
                    .fill(Color.green)
                    .frame(width: 250, height: 250)
                    .border(Color.black)
                    
            }
            .overlay(content: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.clear)
                    .stroke(Color.red, style: .init(lineWidth: 1))
            })
            .border(Color.blue) //이미지의 태두리
//            .clipShape(RoundedRectangle(cornerRadius: 100)) //보더의 모양 설정
            .foregroundStyle(Color.red) //이미지의 색상을 빨간색으로 설정
//        
//        /*
//         .fit
//         .fill
//         x
//         */
//        Circle()
//            .fill(Color.red)
//            .frame(width: 100, height: 100)
        
    }
}

#Preview {
    ContentView()
}
