//
//  AnimationGestures.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import SwiftUI

struct AnimationGestures: View {
    
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello, Cat!")
    @State private var enabled = false
    
    var body: some View {
        HStack(spacing: 0) {
            Text("😻")
                .font(.system(size: 50))
                .offset(dragAmount)
            
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(enabled ? .purple : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation {
                        dragAmount = .zero
                        enabled.toggle()
                    }
                    
                }
        )
    }
}

struct AnimationGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimationGestures()
    }
}
