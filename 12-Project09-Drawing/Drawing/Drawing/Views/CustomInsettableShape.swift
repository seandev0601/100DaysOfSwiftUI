//
//  CustomInsettableShape.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/9.
//

import SwiftUI

struct Arc3: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                                    radius: rect.width / 2 - insetAmount,
                                    startAngle: modifiedStart,
                                    endAngle: modifiedEnd,
                                    clockwise: !clockwise)
        return path
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct CustomInsettableShape: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .stroke(.blue, lineWidth: 40)
                Circle()
                    .strokeBorder(.blue, lineWidth: 40)
            }
            
            // Using the custom Arc shape with inset
            HStack {
                Arc2(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                    .stroke(.blue, lineWidth: 40)
                
                Arc3(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                    .strokeBorder(.blue, lineWidth: 40)
            }
        }
    }
}

struct CustomInsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        CustomInsettableShape()
    }
}
