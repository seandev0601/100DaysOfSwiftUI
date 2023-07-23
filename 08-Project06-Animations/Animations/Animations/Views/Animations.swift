//
//  Animations.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import SwiftUI

struct Animations: View {
    
    @State private var animationAmount = 1.0
    var radius: Double {
        animationAmount.truncatingRemainder(dividingBy: 2)
    }
    
    var body: some View {
        Image("cat")
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: radius * 3)
            .onAppear {
                withAnimation(.linear(duration: 3)) {
                    animationAmount += 1
                }
            }
    }
}

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}
