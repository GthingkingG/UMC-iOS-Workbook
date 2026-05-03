//
//  ImageHandling.swift
//  Week4_VisionPractice
//
//  Created by Air on 6/17/25.
//

import Foundation
import SwiftUI

protocol ImageHandling: AnyObject {
    func addImage(_ images: UIImage)
    func removeImage(at index: Int)
    func getImages() -> [UIImage]
    
    var isImagePickerPresented: Bool { get set }
    var images: [UIImage] { get set }
}
