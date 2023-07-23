//
//  AnimationTransition.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import SwiftUI

struct AnimationTransition: View {
    @State private var isShowingCat = false

    var body: some View {
        VStack {
            Button() {
                withAnimation {
                    isShowingCat.toggle()
                }
            } label: {
                Image("cat")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFill()
                    .clipShape(Circle())
            }
            
            if isShowingCat {
                Image("cat2")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFill()
                    .clipShape(Circle())
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct AnimationTransition_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTransition()
    }
}
