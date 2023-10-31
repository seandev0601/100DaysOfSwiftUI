//
//  EnvironmentObjectAndTabView.swift
//  HotProspects
//
//  Created by Po Hsiang Chao on 2023/10/31.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
            .padding()
            .border(.black)
            .padding()
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentObjectAndTabView: View {
    @StateObject var user = User()
    @State private var selectedTab = "Edit"
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            EditView()
                .tabItem {
                    Label("Edit", systemImage: "pencil")
                }
                .tag("Edit")
            
            DisplayView()
                .onTapGesture {
                    selectedTab = "Edit"
                }
                .tabItem {
                    Label("View", systemImage: "doc.text")
                }
                .tag("View")
        }
        .environmentObject(user)
        .accentColor(.red)
    }
}

#Preview {
    EnvironmentObjectAndTabView()
}
