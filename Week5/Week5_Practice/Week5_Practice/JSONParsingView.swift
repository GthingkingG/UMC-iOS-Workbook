//
//  JSONParsingView.swift
//  Week5_Practice
//
//  Created by Air on 6/30/25.
//

import SwiftUI

struct JSONParsingView: View {
    
    var viewModel: JSONParcingViewModel = .init()
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.loadMyProfile { result in
                    switch result {
                    case .success(_):
                        self.showSheet.toggle()
                    case .failure(let error):
                        print("error: \(error)")
                    }
                }
            }, label: {
                Text("json 파일 파싱하기 버튼")
                    .font(.headline)
                    .foregroundStyle(Color.red)
            })
            .sheet(isPresented: $showSheet, content: {
                VStack {
                    Capsule(style: .circular)
                        .fill(Color.red)
                        .frame(width: 40, height: 5)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    if let profile = viewModel.myProfile {
                        Text(profile.name)
                        Text(profile.type)
                        ScrollView {
                            VStack {
                                ForEach(profile.features, id: \.self) { item in
                                    Text(item.properties.storeName)
                                }
                            }
                        }
                    }
                Spacer()
                }
//                .presentationDragIndicator(.visible)
            })
//            .presentationDetents([.medium, .large])
            .presentationDetents([.medium])
            
            Spacer()
        }
    }
}

#Preview {
    JSONParsingView()
}
