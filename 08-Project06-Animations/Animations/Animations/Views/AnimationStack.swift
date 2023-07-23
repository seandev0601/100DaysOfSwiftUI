//
//  AnimationStack.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false

    var body: some View {
        Button {
            enabled.toggle()
        } label: {
            Image(enabled ? "cat" : "cat2")
                .resizable()
                .scaledToFill()
        }
        .frame(width: 300, height: 300)
        .rotationEffect(.degrees(enabled ? 0 : 360))
        .animation(.linear(duration: 1), value: enabled) // animation 1
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 90 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled) // animation 2
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
