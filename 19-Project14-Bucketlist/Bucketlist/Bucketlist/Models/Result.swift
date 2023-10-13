//
//  Result.swift
//  Bucketlist
//
//  Created by Po Hsiang Chao on 2023/10/12.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let thumbnail: Thumbnail?
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
    
    var imageUrl: URL {
        thumbnail?.url ?? URL(string: "https://hws.dev/img/logo.png")!
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}

struct Thumbnail: Codable, Equatable {
    let source: String
    let width: Int
    let height: Int
    
    var url: URL {
        URL(string: source)!
    }
}
