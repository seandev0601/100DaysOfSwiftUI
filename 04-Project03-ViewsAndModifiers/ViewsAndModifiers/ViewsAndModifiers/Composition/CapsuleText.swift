//
//  CapsuleText.swift
//  ViewsAndModifiers
//
//  Created by Po Hsiang Chao on 2023/7/15.
//

import SwiftUI

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}
