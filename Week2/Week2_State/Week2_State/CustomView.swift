//
//  CustomView.swift
//  Week2_State
//
//  Created by Air on 5/16/25.
//

import SwiftUI

struct CustomView: View {
    
    @Binding var isClicked: Bool
    
    init(isCliked: Binding<Bool>) {
        self._isClicked = isCliked
    }
    
    var body: some View {
        Button(action: {
            isClicked.toggle()
            print("하위 뷰에서 클릭해서 값 변경함 : \(isClicked)")
        }, label: {
            Text("상위 뷰의 값을 State 값 변경")
        })
    }
}
