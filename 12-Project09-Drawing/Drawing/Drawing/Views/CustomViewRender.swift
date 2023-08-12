//
//  CustomViewRender.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/11.
//

import SwiftUI

struct CircleColor: View {
    var amount = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.red)
                .frame(width:  200 * amount)
                .offset(x: -50, y: -80)
                .blendMode(.screen)
            
            Circle()
                .fill(.green)
                .frame(width:  200 * amount)
                .offset(x: 50, y: -80)
                .blendMode(.screen)
            
            Circle()
                .fill(.blue)
                .frame(width:  200 * amount)
                .blendMode(.screen)
        }
        .frame(width: 150, height: 150)
    }
}

struct CircleColor2: View {
    var amount = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(red: 1, green: 0, blue: 0))
                .frame(width:  200 * amount)
                .offset(x: -50, y: -80)
                .blendMode(.screen)
            
            Circle()
                .fill(Color(red: 0, green: 1, blue: 0))
                .frame(width:  200 * amount)
                .offset(x: 50, y: -80)
                .blendMode(.screen)
            
            Circle()
                .fill(Color(red: 0, green: 0, blue: 1))
                .frame(width:  200 * amount)
                .blendMode(.screen)
        }
        .frame(width: 150, height: 150)
    }
}


struct CustomViewRender: View {
    @State private var amount = 0.8
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                ZStack {
                    Image("Example")
                        .resizable()
                        .scaledToFit()
                    Rectangle()
                        .fill(.red)
                        .blendMode(.multiply)
                }
                .frame(width: 150, height: 150)
                .clipped()
                
                Image("Example")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .saturation(amount)
                    .blur(radius: (1 - amount) * 20)
            }
            .frame(width: .infinity)
            .padding(.top, 20)
            
            Spacer()
            Spacer()
            
            VStack(spacing: 100) {
                CircleColor(amount: amount)
                CircleColor2(amount: amount)
            }
            
            Spacer()
            
            Slider(value: $amount)
                .padding()
        }
        .background(.black)
        .ignoresSafeArea()
    }
}

struct CustomViewRender_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewRender()
    }
}
