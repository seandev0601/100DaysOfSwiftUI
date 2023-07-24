//
//  AnimationChallenge.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/24.
//

import SwiftUI

struct AnimationChallenge: View {
    private var cats = ["cat", "cat2", "cat"]
    
    @State private var selectFlag = -1
    @State private var animationAmount = 0.0
    @State private var animationOpacity = 1.0
    @State private var animationScale = 1.0
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button() {
                reset()
            } label: {
                Text("Reset")
                    .font(.largeTitle)
            }
            
            ForEach(0..<3) { number in
                Button {
                    flagTapped(number)
                } label: {
                    Image(cats[number])
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .opacity(selectFlag != number ? animationOpacity : 1.0)
                        .scaleEffect(selectFlag != number ? animationScale : 1.0)
                        .rotation3DEffect(.degrees(selectFlag == number ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
    
    func flagTapped(_ number:Int) {
        selectFlag = number
        withAnimation {
            animationAmount = 360
        }
        withAnimation {
            animationOpacity = 0.25
            animationScale = 0.7
        }
    }
    
    func reset() {
        selectFlag = -1
        animationAmount = 0
        animationOpacity = 1.0
        animationScale = 1.0
    }
}

struct AnimationChallenge_Previews: PreviewProvider {
    static var previews: some View {
        AnimationChallenge()
    }
}
