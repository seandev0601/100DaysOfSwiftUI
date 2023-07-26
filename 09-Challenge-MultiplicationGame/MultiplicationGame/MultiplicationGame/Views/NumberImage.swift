//
//  NumberImage.swift
//  MultiplicationGame
//
//  Created by Po Hsiang Chao on 2023/7/26.
//

import SwiftUI

enum NumberType {
    case none
    case fill
}

struct NumberImage: View {
    var number: Int
    var color: Color
    var type: NumberType
    var size: Double
    
    init(_ number: Int, color: Color = .orange, type: NumberType = .none, size: Double = 50) {
        self.number = number
        self.color = color
        self.type = type
        self.size = size
    }

    var body: some View {
        
        ZStack {
            Circle()
                .strokeBorder(color, lineWidth: 5)
                .background(Circle().fill(type == .none ? .white : color))
                .frame(width: size, height: size)

            Text("\(number)")
//                .font(.system(size: size * 0.4, weight: .medium))
                .font(.custom("ChalkboardSE-Bold", size: size * 0.5))
                .foregroundColor(type == .none ? color : .white)

        }
        
//        Image(systemName: "\(number)" )
//            .resizable()
//            .scaledToFit()
//            .foregroundColor(color)
//            .frame(width: size, height: size)
    }
}

struct NumberImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NumberImage(12)
            NumberImage(10, type: .fill)
            NumberImage(20, color: .blue, type: .fill)
            NumberImage(100, type: .fill ,size: 100)
        }
    }
}
