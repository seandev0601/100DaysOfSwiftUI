//
//  CustomAnimation.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import SwiftUI

struct CustomAnimation: View {
    @State private var animationAmount = 0.0

    var body: some View {
        VStack {
            Image("cat")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                            .animation(
                                .easeInOut(duration: 1)
                                .repeatForever(autoreverses: false),
                                value: animationAmount)
                    )
                .onAppear {
                    animationAmount = 2
                }
        }
    }
}

struct CustomAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimation()
    }
}
