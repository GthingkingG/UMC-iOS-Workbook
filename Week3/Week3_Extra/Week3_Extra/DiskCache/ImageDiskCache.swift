//
//  ImageDiskCache.swift
//  Week3_Extra
//
//  Created by Air on 5/25/25.
//

import SwiftUI

class ImageDiskCache: ObservableObject {
    static let shared = ImageDiskCache()
    
    @Published var image: Image?
    
    private init() {}
    
    func saveImageToDisk(image: UIImage, fileName: String) {
        if let data = image.pngData() {
            let filePath = getFilePath(fileName: fileName)
            do {
                try data.write(to: filePath)
                print("이미지 저장 성공: \(filePath.path)")
            } catch {
                print("이미지 저장 실패: \(error.localizedDescription)")
            }
        }
    }
    
    @MainActor
    func loadImageFromDisk(fileName: String) {
        let filePath = getFilePath(fileName: fileName)
        if FileManager.default.fileExists(atPath: filePath.path),
           let UiImage = UIImage(contentsOfFile: filePath.path) {
            self.image = Image(uiImage: UiImage)
            print("디스크에서 이미지 로드 성공: \(fileName)")
        } else {
            print("이미지 캐시 존재하지 않음: \(fileName)")
        }
    }
    
    func removeImageFromDisk(fileName: String) {
        let filePath = getFilePath(fileName: fileName)
        if FileManager.default.fileExists(atPath: filePath.path) {
            do {
                try FileManager.default.removeItem(at: filePath)
                print("이미지 삭제 완료: \(fileName)")
            } catch {
                print("이미지 삭제 실패: \(error.localizedDescription)")
            }
        } else {
            print("삭제할 이미지가 존해하지 않음: \(fileName)")
        }
    }
    
    func isImageCached(fileName: String) -> Bool {
        let filePath = getFilePath(fileName: fileName)
        return FileManager.default.fileExists(atPath: filePath.path)
    }
    
    func clearCache() {
        let directory = getCacheDirectory()
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil, options: [])
            for fileURL in fileURLs {
                try FileManager.default.removeItem(at: fileURL)
            }
            print("캐시 비우기 성공")
        } catch {
            print("캐시 비우기 실패: \(error.localizedDescription)")
        }
    }
    
    private func getFilePath(fileName: String) -> URL {
        return getCacheDirectory().appendingPathComponent(fileName)
    }
    
    private func getCacheDirectory() -> URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
}
