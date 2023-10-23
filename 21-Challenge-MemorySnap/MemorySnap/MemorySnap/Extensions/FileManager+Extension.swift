//
//  FileManager+Extension.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
