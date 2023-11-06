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
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decode = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decode
                return
            }
        }
        
        people = []
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.setValue(encoded, forKey: saveKey)
        }
    }
}
