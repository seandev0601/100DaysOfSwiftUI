//
//  HomeView-ViewModel.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import UIKit

extension HomeView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var users: [User]
        @Published var showingAddView: Bool = false
        @Published var showingImagePicker = false
        @Published var inputImage: UIImage?
        
        var isEmpty: Bool {
            users.isEmpty
        }
        
        internal init() {
            let fileStorage = FileStorage(type: .json)
            let users = fileStorage.loadData()
            
            self.users = users.sorted()
        }
        
        
        func add(user: User) {
            users.append(user)
            
            let fileStorage = FileStorage(type: .json)
            fileStorage.saveUserData(users)
            users.sort()
        }
    }
}
