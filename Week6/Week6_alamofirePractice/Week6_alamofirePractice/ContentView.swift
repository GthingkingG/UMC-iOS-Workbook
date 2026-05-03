//
//  ContentView.swift
//  Week6_alamofirePractice
//
//  Created by Air on 7/6/25.
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
    }
}

struct ButtonInfo: Identifiable {
    var id: UUID = .init()
    var title: String
    var action: () -> Void
}

final class ButtonInfoList {
    
    static let serviceManager: ServiceManager = .init()
    
    static let buttonList: [ButtonInfo] = [
        .init(title: "GET", action: {
            Task {
                await serviceManager.getUser(name: "동민")
            }
        }),
        .init(title: "POST", action: {
            Task {
                await serviceManager.postUser(user: .init(name: "One", age: 25, address: "포항시 지곡동", height: 174))
            }
        }),
        .init(title: "PATCH", action: {
            Task {
                await serviceManager.patchUser(name: "동민")
            }
        }),
        .init(title: "PUT", action: {
            Task {
            await serviceManager.putUser(user: .init(name: "동민", age: 24, address: "포항시 효자동", height: 173))
            }
        }),
        .init(title: "DELETE", action: {
            Task {
                await serviceManager.deleteUser(name: "동민")
            }
        })
    ]
}

#Preview {
    ContentView()
}
