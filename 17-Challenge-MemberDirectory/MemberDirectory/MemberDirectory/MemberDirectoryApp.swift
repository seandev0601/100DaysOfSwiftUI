//
//  MemberDirectoryApp.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/13.
//

import SwiftUI

@main
struct MemberDirectoryApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
