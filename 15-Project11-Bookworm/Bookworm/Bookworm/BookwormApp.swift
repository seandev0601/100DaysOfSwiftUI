//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Po Hsiang Chao on 2023/8/26.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
