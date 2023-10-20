//
//  AnstronautView.swift
//  Moonshot
//
//  Created by Po Hsiang Chao on 2023/8/2.
//

import SwiftUI

struct AnstronautView: View {
    let anstronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(anstronaut.id)
                    .resizable()
                    .scaledToFit()
                    .accessibilityHidden(true)
                Text(anstronaut.description)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(anstronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AnstronautView(anstronaut: astronauts["aldrin"]!)
    }
}
