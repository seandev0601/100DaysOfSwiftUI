//
//  DataController.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/16.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendFace")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
        }
    }
}
