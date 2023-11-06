//
//  Prospect.swift
//  HotProspects
//
//  Created by Po Hsiang Chao on 2023/11/3.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Paul Hudson"
    var emailAddress = "paul@hackingwithswift.com"
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = [Prospect()]
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
