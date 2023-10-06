//
//  Location.swift
//  Bucketlist
//
//  Created by Po Hsiang Chao on 2023/10/6.
//

import MapKit

struct Location: Identifiable, Codable, Equatable  {
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), name: "Taipei 101", description: "The tallest edifice in Taiwan.", latitude: 25.033611, longitude: 121.564444)
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
