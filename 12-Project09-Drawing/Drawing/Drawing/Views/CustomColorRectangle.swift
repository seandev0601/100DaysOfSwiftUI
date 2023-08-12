//
//  CustomColorRectangle.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/12.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    let steps = 150
    var startPointX = 1.0
    var endPointY = 1.0

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                        gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5)
                        ]),
                        startPoint: UnitPoint(x: startPointX, y: 0),
                        endPoint: UnitPoint(x: 0, y: endPointY)),
                        lineWidth: 2)
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct CustomColorRectangle: View {
    @State private var color = 0.5
    @State private var startPointX = 0.5
    @State private var endPointY = 0.5
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: color, startPointX: startPointX, endPointY: endPointY)
                .frame(width: 300, height: 300)
            
            Text("Color amount: \(color, format: .number.precision(.fractionLength(1)))")
            Slider(value: $color, in: 0.0...1.0)
            
            Text("Start PointX: \(startPointX, format: .number.precision(.fractionLength(1)))")
            Slider(value: $startPointX, in: 0.0...1.0)
            
            Text("End PointY: \(endPointY, format: .number.precision(.fractionLength(1)))")
            Slider(value: $endPointY, in: 0.0...1.0)
        }
    }
}

struct CustomColorRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CustomColorRectangle()
    }
}
