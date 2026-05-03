//
//  ContentView.swift
//  Week3_CoverCarousel
//
//  Created by Air on 5/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var activeID: UUID?
    @State private var text: String = ""
    @State private var isCardCliked: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                TopView
                
                
                
                
                Button(action: {
                    isCardCliked.toggle()
                }, label: {
                    CustomCarousel(config: .init(hasOpacity: true, hasScale: true, cardWidth: 310, minimumCardWidth: 30), selection: $activeID, data: images, content: {
                        item in
                        CardView(item: item)
                        
                    }, text: $text)
                    .foregroundStyle(Color.black)
                })
                
                HStack(spacing: 11) {
                    MakeButtonView(title: "테스크 확인", icon: "doc")
                    
                    MakeButtonView(title: "보관함에 저장", icon: "archivebox")
                }
                .padding(50)
            }
            
        }
    }
    
    private var TopView: some View {
        HStack {
            Text("DoubleTake")
                .font(.headline)
            Spacer()
            
            HStack(spacing: 7) {
                Button(action: {
                    print("Apple Calendar")
                }, label: {
                    Image(systemName: "calendar")
                        .foregroundStyle(Color.black)
                })
                Button(action: {
                    print("Add Project")
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.black)
                })
            }
        }
        .padding(.horizontal, 29)
        .padding(.top, 36)
    }
    
    func CardView(item: ImageModel) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.orange)
            if isCardCliked {
                CardMainView(title: item.text, image: item.image)
            } else {
                CardDetailView(title: item.text, image: item.image)
            }
        }
        .frame(width: 310, height: 396)
    }
    
    func MakeButtonView(title: String, icon: String) -> some View {
        Button(action: {
            print(title)
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 150, height: 46)
                    .foregroundStyle(Color.gray)
                Label(title, systemImage: icon)
                    .foregroundStyle(Color.black)
            }
        })
    }
    
    func CardMainView(title: String, image: String) -> some View {
        VStack(alignment: .leading) {
            Text("프로젝트 \(title)")
                .font(.headline)
            Text("qwer")
                .font(.subheadline)
            Spacer()
            Text("처음 연락받은 날")
                .font(.headline)
            Spacer()
            Text("예산")
                .font(.headline)
            Spacer()
            HStack {
                VStack {
                    Text("선호도")
                        .font(.headline)
                    Text("상 중 하")
                        .font(.subheadline)
                }
                Image(image)
            }
        }
        .padding(24)
    }
    
    func CardDetailView(title: String, image: String) -> some View {
        VStack(alignment: .leading) {
            Text("프로젝트 \(title)")
                .font(.headline)
            Text("직무")
                .font(.subheadline)
            Spacer()
            Text("클라이언트")
                .font(.headline)
            Spacer()
            Text("촬영 로케이션")
                .font(.headline)
            Spacer()
            HStack {
                VStack {
                    Text("종료날짜")
                        .font(.headline)
                    Text("2025.05.27")
                        .font(.subheadline)
                }
                Image(image)
            }
        }
        .padding(24)
    }
    
}

#Preview {
    ContentView()
}
