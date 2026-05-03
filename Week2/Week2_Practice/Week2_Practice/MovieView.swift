//
//  MovieView.swift
//  Week2_Practice
//
//  Created by Air on 5/18/25.
//

import SwiftUI
import Observation

struct MovieView: View {
    
    @AppStorage("movieName") private var movieName: String = ""
    private var viewModel: MovieViewModel = .init()
    
    var body: some View {
        VStack(spacing: 56) {
            MovieCard(movieInfo: viewModel.movieModel[viewModel.currentIndex])
            
            leftRightChange
            
            settingMovie
            
            printAppStorageValue
        }
        .padding()
    }
    
    private var leftRightChange: some View {
        HStack {
            Group {
                makeChevron(name: "chevron.left", action: viewModel.previousMovie)
                
                Spacer()
                
                makeChevron(name: "chevron.right", action: viewModel.nextMovie)
            }
            .foregroundStyle(Color.black)
        }
        .frame(width: 256)
        .padding(.vertical, 17) //영화 바꾸기 버튼의 상하 여백
        .padding(.horizontal, 22) //영화 바꾸기 버튼의 좌우 여백
    }
    
    private func makeChevron(name: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: name)
                .resizable()
                .frame(width: 17.47, height: 29.73)
        })
    }
    
    private var settingMovie: some View {
        Button(action: {
            self.movieName = viewModel.movieModel[viewModel.currentIndex].movieName
        }, label: {
            Text("대표 영화로 설정")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(Color.black)
                .padding(.top, 21)
                .padding(.bottom, 20)
                .padding(.leading, 53)
                .padding(.trailing, 52)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.clear)
                        .stroke(Color.black, style: .init(lineWidth: 1))
                })
        })
    }
    
    private var printAppStorageValue: some View {
        VStack(spacing: 17) {
            Text("@AppStorage에 저장된 영화")
                .font(.system(size: 30, weight: .regular))
                .foregroundStyle(Color.black)
            Text("현재 저장된 영화 : \(movieName)")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(Color.red)
        }
    }
    
}

#Preview {
    MovieView()
}
