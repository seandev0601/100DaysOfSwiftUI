//
//  CustomTrapezoidAnimation.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/11.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct Trapezoid2: Shape {
    var insetAmount: Double
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct CustomTrapezoidAnimation: View {
    @State private var insetAmount = 50.0

    var body: some View {
        VStack(spacing: 20) {
            Trapezoid(insetAmount: insetAmount)
                .frame(width: 200, height: 100)
            
            Trapezoid2(insetAmount: insetAmount)
                .fill(.blue)
                .frame(width: 200, height: 100)
        }
        .onTapGesture {
            // Add animation
            withAnimation {
                insetAmount = Double.random(in: 0...100)
            }
        }
    }
}

struct CustomTrapezoidAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CustomTrapezoidAnimation()
    }
}
