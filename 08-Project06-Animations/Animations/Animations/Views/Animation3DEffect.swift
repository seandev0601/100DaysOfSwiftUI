//
//  3DEffectAnimation.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import SwiftUI

struct Animation3DEffect: View {
    @State private var animationAmount = 0.0

    var body: some View {
        VStack {
            Image("cat")
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .rotation3DEffect(.degrees(animationAmount)
                                  , axis: (x: 0, y: 1, z: 0))
                .onTapGesture {
                    withAnimation(
                        .interpolatingSpring(stiffness: 5, damping: 1)) {
                                animationAmount += 360
                    }
                }
        }
    }
}

struct Animation3DEffect_Previews: PreviewProvider {
    static var previews: some View {
        Animation3DEffect()
    }
}
