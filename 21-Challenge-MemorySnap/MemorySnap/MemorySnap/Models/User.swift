//
//  User.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import Foundation
import SwiftUI

struct User: Codable, Comparable, Identifiable {
    let id: UUID
    let name: String
    let photoPath: String
    let createTime: Date
    
    var image: Image? {
        let fileStorage = FileStorage(type: .image, fileName: photoPath)
        if let uiImage = fileStorage.loadImage() {
            return Image(uiImage: uiImage)
        } else {
            return nil
        }
    }
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}
