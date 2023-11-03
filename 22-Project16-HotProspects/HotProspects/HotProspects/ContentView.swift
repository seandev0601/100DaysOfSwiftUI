//
//  ContentView.swift
//  HotProspects
//
//  Created by Po Hsiang Chao on 2023/10/31.
//

import SwiftUI

struct ContentView: View {
    @StateObject var prospets = Prospects()
    
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
        
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        .environmentObject(prospets)
    }
}

#Preview {
    ContentView()
}
