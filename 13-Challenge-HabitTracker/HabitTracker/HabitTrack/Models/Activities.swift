//
//  Activities.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/16.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: saveItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
    
    var heartItems: [Activity] {
        items.filter { $0.iconName == SymbolIcon.heart.rawValue }
    }
    
    var starItems: [Activity] {
        items.filter { $0.iconName == SymbolIcon.star.rawValue }
    }
    
    var circleItems: [Activity] {
        items.filter { $0.iconName == SymbolIcon.circle.rawValue }
    }
    
    func getActivity(id: UUID) -> Activity? {
        if let index = items.firstIndex(where: { $0.id == id }) {
            return items[index]
        }
        return nil
    }
    
    func addActivity(_ activity: Activity) {
        items.append(activity)
    }
    
    func addCompletion(id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            var activity = items[index]
            activity.completions.insert(Completion(), at: 0)
            
            items[index] = activity
            self.objectWillChange.send()
        }
    }
}
