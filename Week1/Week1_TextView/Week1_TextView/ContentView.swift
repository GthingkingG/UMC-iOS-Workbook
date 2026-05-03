//
//  ContentView.swift
//  Week1_TextView
//
//  Created by Air on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI!")
                .font(.largeTitle) //텍스트의 기본 글꼴을 크게 설정
                .foregroundStyle(Color.red) //텍스트의 글 색상을 빨간색으로 설정
                .underline() //텍스트에 밑줄 생성
                .strikethrough(true, color: Color.black) //취소선을 생성하고, 취소선의 색을 검정색으로 설정
                .lineLimit(nil)  //텍스트 줄 제한 없음으로 설정
                .kerning(1.5) //문자 간격을 1.5포인트 추가
                .lineSpacing(2.5) //텍스트 높이 간격을 2.5로 설정
                .padding() //모든 가장자리 면에 여백 설정
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.clear)
                        .stroke(Color.black, style: .init(lineWidth: 1))
                }) //오버레이는 뷰 원본의 공간을 기준으로 그 위에 새로운 뷰를 중첩하여 쌓는 기능을 한다. 둥근 사각형 모양, 태두리 색이 검정색이고 굵기가 1인 뷰를 텍스트 뷰 위에 쌓는다.
                .dynamicTypeSize(.large) //사용자의 접근성 설정에 따라 앱의 텍스트 크기를 .large로 제한하기 위해 사용
            
        
//                .fontWeight(.thin)
//                .fontDesign(.serif)
//                .fontWidth(.condensed)
            
                
//                .bold()
//                .italic()
                
                
//                .monospaced()
//                .monospacedDigit()
//                .kerning(24)
//                .tracking(24)
//                .baselineOffset(500)
//                .textCase(.uppercase)
            
//                .textScale(.secondary)
//                .truncationMode(.head)
            
//                .typesettingLanguage(.automatic)
            
                
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
