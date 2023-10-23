//
//  AddView-ViewModel.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import UIKit

extension AddView {
    @MainActor class ViewModel: ObservableObject {
        @Published var inputImage: UIImage?
        @Published var name: String
        
        var disable: Bool {
            inputImage != nil && name.isEmpty
        }
        
        internal init(inputImage: UIImage? = nil, name: String = "") {
            self.inputImage = inputImage
            self.name = name
        }
        
        func save() -> User? {
            guard let image = inputImage else { return nil }
            let fileStorage = FileStorage(type: .image)
            
            guard let photoPath = fileStorage.saveImage(image: image) else { return nil }
            let newUser = User(id: UUID(), name: name, photoPath: photoPath, createTime: Date.now)
            
            return newUser
        }
    }
}
