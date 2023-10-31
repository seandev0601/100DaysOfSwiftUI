//
//  User.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct User: Codable, Comparable, Identifiable {
    let id: UUID
    let name: String
    let photoPath: String
    let latitude: Double?
    let longitude: Double?
    let createTime: Date
    
    var image: Image? {
        let fileStorage = FileStorage(type: .image, fileName: photoPath)
        if let uiImage = fileStorage.loadImage() {
            return Image(uiImage: uiImage)
        } else {
            return nil
        }
    }
    
    var coordinate: CLLocationCoordinate2D? {
        guard let latitude = latitude else { return nil }
        guard let longitude = longitude else { return nil }
        
        return .init(latitude: latitude, longitude: longitude)
    }
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}
