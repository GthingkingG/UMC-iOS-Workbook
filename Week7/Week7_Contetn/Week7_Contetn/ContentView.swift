//
//  ContentView.swift
//  Week7_Contetn
//
//  Created by Air on 8/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
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
    static let serviceManager: CotentViewModel = .init()
    
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
            serviceManager.createUser(.init(name: "제옹", age: 29, address: "포항시 지곡동", height: 178))
        }),
        .init(title: "PATCH", action: {
            serviceManager.updateUserPatch(.init(name: nil, age: 25, address: nil, height: nil))
        }),
        .init(title: "PUT", action: {
            serviceManager.updateUserPut(.init(name: "JEONG", age: 28, address: "포항시 효자동", height: 187))
        }),
        .init(title: "DELETE", action: {
            serviceManager.deleteUser(name: "제옹")
        })
    ]
}


#Preview {
    ContentView()
}
