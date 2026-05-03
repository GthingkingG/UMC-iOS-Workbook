//
//  TextViewModel.swift
//  Week2_StateObject
//
//  Created by Air on 5/17/25.
//

import SwiftUI

class TextViewModel: ObservableObject {
    @Published var inputText: String = ""
    
    init() {
        print("✅ 새로운 TextViewModel 인스턴스 생성됨! ✅")
    }
}
