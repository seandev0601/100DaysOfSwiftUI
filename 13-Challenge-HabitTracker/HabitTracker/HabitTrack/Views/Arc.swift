//
//  Arc.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/18.
//

import SwiftUI

struct Arc: Shape {
    var startAngle: Angle = Angle.degrees(0)
    var endAngle: Angle
    var clockwise: Bool = true

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

extension Arc {
    init(progress: Double) {
        endAngle = Angle.degrees(360 * progress)
    }
}
