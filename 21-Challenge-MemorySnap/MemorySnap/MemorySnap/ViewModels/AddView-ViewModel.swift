//
//  AddView-ViewModel.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import UIKit
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let latitude: Double?
    let longitude: Double?
}

extension AddView {
    @MainActor class ViewModel: ObservableObject {
        @Published var inputImage: UIImage?
        @Published var name: String
        let locationFetcher: LocationFetcher
        
        @Published var coordinate: CLLocationCoordinate2D?
        
        var location: [Location] {
            [Location(latitude: latitude, longitude: longitude)]
        }
        
        var latitude: Double? {
            coordinate?.latitude
        }
        
        var longitude: Double? {
            coordinate?.longitude
        }
        
        var disable: Bool {
            inputImage != nil && name.isEmpty
        }
        
        internal init(inputImage: UIImage? = nil, name: String = "") {
            self.inputImage = inputImage
            self.name = name
            self.locationFetcher = LocationFetcher()
            self.locationFetcher.start()
        }
        
        func loadLocation()  {
            self.coordinate = locationFetcher.lastKnownLocation
        }
        
        func save() -> User? {
            guard let image = inputImage else { return nil }
            let fileStorage = FileStorage(type: .image)
            
            guard let photoPath = fileStorage.saveImage(image: image) else { return nil }
            let newUser = User(id: UUID(), name: name, photoPath: photoPath, latitude: latitude, longitude: longitude, createTime: Date.now)
            
            return newUser
        }
    }
}
