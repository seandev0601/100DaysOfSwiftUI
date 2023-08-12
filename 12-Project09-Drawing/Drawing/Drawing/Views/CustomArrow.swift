//
//  CustomArrow.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/12.
//

import SwiftUI

enum ArrowShape {
    case triangle, rectangle, circle
    
    func path(rect: CGRect) -> Path {
        var path = Path()
        
        switch self {
        case .triangle:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        case .rectangle:
            path.addRect(rect)
        case .circle:
            path.addEllipse(in: rect)
        }
        
        return path
    }
}

struct Arrow: InsettableShape {
    var thickness: Double
    var insetAmount: CGFloat = 0.0
    var arrowShape: ArrowShape = .triangle
    
    var animatableData: Double {
        get { thickness }
        set { thickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        
        let topRect = CGRect(x: rect.maxX / 7, y: rect.minY, width: rect.maxX / 7 * 5, height: rect.maxY / 3)
        
        var path = arrowShape.path(rect: topRect)
        
        let lineHeight = rect.maxY / 3 * 2
        let lineThickness = thickness
        let lineX = rect.midX - lineThickness / 2
        let lineY = rect.maxY / 3
        
        let lineRect = CGRect(x: lineX, y:  lineY, width: lineThickness, height: lineHeight)
        path.addRect(lineRect)

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.insetAmount += amount
        return shape
    }
    
}

struct CustomArrow: View {
    @State private var thickness: Double = 10.0
    @State private var lineWidth = 20.0
    
    var body: some View {
        VStack {
            Button {
                withAnimation(.linear(duration: 1.5)) {
                    thickness = Double.random(in: 5.0...30.0)
                    lineWidth = Double.random(in: 3.0...20.0)
                }
            } label: {
                VStack {
                    HStack {
                        Arrow(thickness: thickness)
                            .stroke(.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                            .frame(width: 100, height: 200)
                        
                        Arrow(thickness: thickness, arrowShape: .rectangle)
                            .stroke(.green, lineWidth: lineWidth)
                            .frame(width: 100, height: 200)
                        
                        Arrow(thickness: thickness, arrowShape: .circle)
                            .stroke(.blue, lineWidth: lineWidth)
                            .frame(width: 100, height: 200)
                    }
                    .padding()
                    
                    Text("Tap me")
                }
            }
        }
    }
}



struct CustomArrow_Previews: PreviewProvider {
    static var previews: some View {
        CustomArrow()
    }
}
