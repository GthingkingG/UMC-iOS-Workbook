//
//  ContentView.swift
//  Week4_PhotosPicker
//
//  Created by Air on 6/17/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selecetdItems: [PhotosPickerItem] = []
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    
    private var viewModel: OCRViewModel = .init()
    
    var body: some View {
        VStack(spacing: 20) {
            Button("📷 사진 추가하기") {
                showActionSheet = true
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.getImage(), id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }
                }
            }
            if !viewModel.recognizedText.isEmpty {
                Divider()
                Text("📝 OCR 결과")
                    .font(.headline)
                ScrollView {
                    Text(viewModel.recognizedText)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.secondarySystemBackground))
                }
                .frame(height: 200)
            } else {
                Text("추출 결과 값 없음")
            }
        }
        .confirmationDialog("사진을 어떻게 추가할까요?", isPresented: $showActionSheet, titleVisibility: .visible) {
            Button("앨범에서 가져오기") {
                showPhotosPicker = true
            }
            Button("카메라로 촬영하기") {
                showCamera = true
            }
            Button("취소", role: .cancel) {}
        }
        .sheet(isPresented: $showCamera) {
            CameraPicker { image in
                viewModel.addImage(image)
            }
        }
        .photosPicker(isPresented: $showPhotosPicker, selection: $selecetdItems, maxSelectionCount: 5, matching: .images)
        .onChange(of: selecetdItems) { oldItems, newItems in
            for item in newItems {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self), let image = UIImage(data: data) {
                        viewModel.addImage(image)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
