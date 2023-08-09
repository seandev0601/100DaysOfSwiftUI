//
//  CustomShape.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/9.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}

struct Arc2: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        return path
    }
}


struct CustomShape: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 30) {
                Triangle()
                    .fill(.orange)
                    .frame(width: 150, height: 150)
                Triangle()
                    .stroke(.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .frame(width: 150, height: 150)
            }
            .padding()
            
            HStack(spacing: 30) {
                Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                    .stroke(.blue, lineWidth: 10)
                    .frame(width: 150, height: 150)
                
                Arc2(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                    .stroke(.blue, lineWidth: 10)
                    .frame(width: 150, height: 150)
            }
        }
    }
}

struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        CustomShape()
    }
}
