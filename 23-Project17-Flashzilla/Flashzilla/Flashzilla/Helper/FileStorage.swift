//
//  FileStorage.swift
//  Flashzilla
//
//  Created by Po Hsiang Chao on 2024/1/18.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}

struct FileStorage {
    static let locationFileName = "cards.json"
    
    let filePath: URL
    
    init() {
        self.filePath = FileManager.documentsDirectory.appendingPathComponent(FileStorage.locationFileName)
    }
}

extension FileStorage {
    
    func saveData(with cards: [Card]) {
        do {
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(cards)
            try data.write(to: self.filePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func loadData() -> [Card] {
        var cards: [Card]
        do {
            let decoder = JSONDecoder()
            
            let data = try Data(contentsOf: self.filePath)
            cards = try decoder.decode([Card].self, from: data)
        } catch {
            cards = []
            print("Unable to load data.")
        }
        
        return cards
    }
}
