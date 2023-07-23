//
//  ContentView.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section() {
                    ForEach(AppData.day32Topic) { data in
                        NavigationLink {
                            data.view
                        } label: {
                            Text("\(data.name)")
                        }
                    }
                    
                } header: {
                    Text("Day 32")
                        .font(.headline)
                }
                
                Section() {
                    ForEach(AppData.day33Topic) { data in
                        NavigationLink {
                            data.view
                        } label: {
                            Text("\(data.name)")
                        }
                    }
                    
                } header: {
                    Text("Day 33")
                        .font(.headline)
                }
                
            }
            .navigationTitle("Animations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
