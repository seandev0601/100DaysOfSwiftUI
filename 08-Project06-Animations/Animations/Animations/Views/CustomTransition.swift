//
//  CustomTransition.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import SwiftUI

struct CustomTransition: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Image("cat")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFill()
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct CustomTransition_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransition()
    }
}
