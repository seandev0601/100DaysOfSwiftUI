//
//  FileManager+Extension.swift
//  HotProspects
//
//  Created by Po Hsiang Chao on 2023/11/7.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
