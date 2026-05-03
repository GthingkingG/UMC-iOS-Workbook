//
//  ContentView.swift
//  Week4_VNRecognizedTextRequest
//
//  Created by Air on 6/16/25.
//

import SwiftUI
import Vision

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func performOCR(on uiImage: UIImage) {
        guard let cgImage = uiImage.cgImage else { return }
        let request = VNRecognizeTextRequest { request, error in
            guard let results = request.results as? [VNRecognizedTextObservation] else { return }
            
            DispatchQueue.main.async {
                recognizedText = results.compactMap {
                    $0.topCandidates(1).first?.string
                }
            }
        }
        
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        request.recognitionLanguages = ["ko-KR", "en-US"]
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                print("OCR 실패: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
