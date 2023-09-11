//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/8/31.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section("Day 57 - Part 1") {
                    ForEach(AppData.day57Topic, id: \.name) { data in
                        NavigationLink {
                            data.view
                        } label: {
                            Text("\(data.name)")
                        }
                    }
                }
                
                Section("Day 58 - Part 2") {
                    ForEach(AppData.day58Topic, id: \.name) { data in
                        NavigationLink {
                            data.view
                        } label: {
                            Text("\(data.name)")
                        }
                    }
                }
                
                Section("Day 59 - Part 3") {
                    ForEach(AppData.day59Topic, id: \.name) { data in
                        NavigationLink {
                            data.view
                        } label: {
                            Text("\(data.name)")
                        }
                    }
                }
            }
            .navigationTitle("Core Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
