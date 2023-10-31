//
//  UserDetailView.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @State var user: User
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .top, endPoint: .bottomLeading)
                .ignoresSafeArea()
            VStack {
                user.image?
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                if let coordinate = user.coordinate {
                    if #available(iOS 17, *) {
                        Map(initialPosition: .region(MKCoordinateRegion(center: coordinate, span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)))) {
                            Marker("", coordinate: coordinate)
                                .tint(.orange)
                        }
                    } else {
                        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [user]) { _ in
                            MapMarker(coordinate: coordinate)
                        }
                        .frame(height: .infinity)
                    }
                } else {
                    Text("Unknown location...")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding()
                }
                
            }
            
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DetailView()
//}
