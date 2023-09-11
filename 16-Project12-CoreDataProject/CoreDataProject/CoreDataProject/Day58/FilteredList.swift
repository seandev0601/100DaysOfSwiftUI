//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/9/8.
//

import CoreData
import SwiftUI

enum Predicate: String, CaseIterable {
    case beginsWith = "beginswith[c]"
    case contains = "contains[c]"
    
    var value: String {
        self.rawValue
    }
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id:\.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String,
         predicate: Predicate = .beginsWith,
         filterValue: String,
         sortDescriptors: [SortDescriptor<T>] = [],
         @ViewBuilder content: @escaping (T) -> Content) {
        
        if filterValue.isEmpty {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors)
        } else {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate.value) %@", filterKey, filterValue))
        }
        self.content = content
    }
}
