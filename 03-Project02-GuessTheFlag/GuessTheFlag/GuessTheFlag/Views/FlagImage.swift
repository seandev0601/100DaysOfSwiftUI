//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Po Hsiang Chao on 2023/7/16.
//

import SwiftUI

struct FlagImage: View {
    var flagName: String
    
    init(_ flagName: String) {
        self.flagName = flagName
    }

    var body: some View {
        Image(flagName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
