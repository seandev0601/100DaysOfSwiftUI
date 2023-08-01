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
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
NavigationView {
    ScrollView {
        LazyVGrid(columns: columns) {
            ForEach(mission) { mission in
                NavigationLink {
                    Text("Detail View")
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
    .navigationTitle("Moonshot")
    .background(.darkBackground)
    .preferredColorScheme(.dark)
}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
