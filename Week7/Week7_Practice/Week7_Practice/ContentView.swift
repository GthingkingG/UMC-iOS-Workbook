//
//  ContentView.swift
//  Week7_Practice
//
//  Created by Air on 7/21/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(ButtonInfoList.buttonList, id: \.id) { button in
                Button(action: {
                    button.action()
                }, label: {
                    Text(button.title)
                })
            }
        }
        .padding()
    }
}

struct ButtonInfo: Identifiable {
    var id: UUID = .init()
    var title: String
    var action: () -> Void
}

final class ButtonInfoList {
    static let serviceManager: ContentViewModel = .init()
    
    static let buttonList: [ButtonInfo] = [
        .init(title: "로그인", action: {
            serviceManager.loginAndStoreTokens()
        }),
        .init(title: "GET", action: {
            Task {
                await serviceManager.getUser()
            }
        }),
        .init(title: "POST", action: {
            serviceManager.createUser(.init(name: "원", age: 25, address: "포항시 효자동", height: 174))
        }),
        .init(title: "PATCH", action: {
            serviceManager.updateUserPatch(.init(name: nil, age: 18, address: nil, height: nil))
        }),
        .init(title: "PUT", action: {
            serviceManager.updateUserPut(.init(name: "One", age: 25, address: "경기도 수원", height: 174))
        }),
        .init(title: "DELETE", action: {
            serviceManager.deleteUser(name: "One")
        }),
    ]
}

#Preview {
    ContentView()
}
