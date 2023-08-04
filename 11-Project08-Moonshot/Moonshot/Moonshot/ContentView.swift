//
//  ContentView.swift
//  Moonshot
//
//  Created by Po Hsiang Chao on 2023/7/31.
//

import SwiftUI

struct ContentView: View {
    
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showListView = false
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                if showListView {
                    LazyVStack {
                        ForEach(mission) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronaut: astronaut)
                            } label: {
                                ListItemView(
                                    imageName: mission.image,
                                    name: mission.displayName,
                                    date: mission.formattedLaunchDate)
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(mission) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronaut: astronaut)
                            } label: {
                                GridItemView(
                                    imageName: mission.image,
                                    name: mission.displayName,
                                    date: mission.formattedLaunchDate)
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showListView.toggle()
                } label: {
                    Image(systemName: showListView ? "square.grid.2x2" : "list.bullet")
                }
                .scaleEffect(showListView ? 1 : 1.5)
                .animation(.linear(duration: 0.2), value: showListView)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
