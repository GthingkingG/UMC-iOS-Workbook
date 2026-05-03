//
//  ImageHandling.swift
//  Week4_PhotosPicker
//
//  Created by Air on 6/17/25.
//

import UIKit

protocol ImageHandling: AnyObject {
    func addImage(_ image: UIImage)
    func getImage() -> [UIImage]
    var recognizedText: String { get set }
}
