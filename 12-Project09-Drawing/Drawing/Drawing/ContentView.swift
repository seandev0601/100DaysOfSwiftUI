//
//  ContentView.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Part 1") {
                    ForEach(AppData.day43Topic, id: \.name) { data in
                        NavigationLink {
                            data.view
                        } label: {
                            Text("\(data.name)")
                        }
                    }
                }
                
                Section("Part 2") {
                    ForEach(AppData.day44Topic, id: \.name) { data in
                        NavigationLink {
                            data.view
                        } label: {
                            Text("\(data.name)")
                        }
                    }
                }
                
            }
            .navigationTitle("Drawing shapes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
