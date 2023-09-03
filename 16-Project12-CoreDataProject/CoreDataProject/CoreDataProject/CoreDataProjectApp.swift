//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/8/31.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
