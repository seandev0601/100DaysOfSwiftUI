//
//  MapKitAndFaceIDView.swift
//  Bucketlist
//
//  Created by Po Hsiang Chao on 2023/10/5.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapKitAndFaceIDView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.045314, longitude: 121.5463445), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    let locations = [
        Location(name: "Tapei 101", coordinate: CLLocationCoordinate2D(latitude: 25.033611, longitude: 121.564444)),
        Location(name: "CKS Memorial Hall", coordinate: CLLocationCoordinate2D(latitude: 25.035556, longitude: 121.519722))
    ]
    
    @State private var isUnlocked = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                if isUnlocked {
                    Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                        MapAnnotation(coordinate: location.coordinate) {
                            NavigationLink {
                                Text("\(location.name)")
                                    .foregroundColor(.red)
                            } label: {
                                VStack {
                                    Circle()
                                        .stroke(.red, lineWidth: 2)
                                        .frame(width: 40, height: 40)
                                    Text("\(location.name)")
                                        .bold()
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                    .frame(height: 400)
                    
                    Spacer()
                } else {
                    Text("Locked")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                        .onAppear(perform: authenticate)
                }
            }
            
            .navigationTitle("Taipei Explorer")
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                if success {
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            //
        }
    }
}

struct MapKitAndFaceIDView_Previews: PreviewProvider {
    static var previews: some View {
        MapKitAndFaceIDView()
    }
}
