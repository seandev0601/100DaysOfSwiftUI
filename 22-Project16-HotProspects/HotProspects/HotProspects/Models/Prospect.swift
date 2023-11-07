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
    var create_time: Date = Date.now
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let filePath: URL
    let locationFileName = "contacte.json"
    var sortField: CompareField = .name
    
    init() {
        self.filePath = FileManager.documentsDirectory.appendingPathComponent(locationFileName)
        
        do {
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            let data = try Data(contentsOf: self.filePath)
            people = try decoder.decode([Prospect].self, from: data)
            return
        } catch {
            print("Unable to load data. \(error.localizedDescription)")
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
        do {
            let encoder = JSONEncoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            encoder.dateEncodingStrategy = .formatted(formatter)
            
            let data = try encoder.encode(people)
            try data.write(to: self.filePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data. \(error.localizedDescription)")
        }
    }
}

extension Prospects {
    enum CompareField {
        case name, email, time
        
        var fieldName: String {
            switch self {
            case .name:
                "Name"
            case .email:
                "Email"
            case .time:
                "CreateTime"
            }
        }
        
        func sorted (lhs: Prospect, rhs: Prospect) -> Bool {
            switch self {
            case .name:
                lhs.name < rhs.name
            case .email:
                lhs.emailAddress < rhs.emailAddress
            case .time:
                lhs.create_time > rhs.create_time
            }
            
        }
    }
}
