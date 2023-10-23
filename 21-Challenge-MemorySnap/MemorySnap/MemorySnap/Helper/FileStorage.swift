//
//  FileStorage.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import Foundation
import UIKit

struct FileStorage {
    
    enum FileType {
        case json, image
    }
    
    let type: FileType
    let filePath: URL
    
    init(type: FileType, fileName: String? = nil) {
        self.type = type
        
        switch self.type {
        case .json:
            self.filePath = FileManager.documentsDirectory.appendingPathComponent("memory_snap.json")
        case .image:
            self.filePath = FileManager.documentsDirectory.appendingPathComponent(fileName ?? "\(UUID().uuidString).jpg")
        }
    }
}

extension FileStorage {
    
    func saveUserData(_ users: [User]) {
        do {
            let encoder = JSONEncoder()
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .full
            encoder.dateEncodingStrategy = .formatted(formatter)
            
            let data = try encoder.encode(users)
            try data.write(to: self.filePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func saveImage(image: UIImage) -> String? {
        do {
            if let jpegData = image.jpegData(compressionQuality: 0.8) {
                try jpegData.write(to: self.filePath, options: [.atomic, .completeFileProtection])
                return self.filePath.lastPathComponent
            }
        } catch {
            print("Unable to save data.")
        }
        
        return nil
    }
    
    func loadData() -> [User] {
        var users: [User]
        do {
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .full
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            let data = try Data(contentsOf: self.filePath)
            users = try decoder.decode([User].self, from: data)
        } catch {
            users = []
            print("Unable to load data.")
        }
        
        return users
    }
    
    func loadImage() -> UIImage? {
        return UIImage(contentsOfFile: self.filePath.path)
    }
}
