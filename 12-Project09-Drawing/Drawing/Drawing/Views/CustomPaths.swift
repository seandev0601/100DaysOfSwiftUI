//
//  CustomPaths.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/7.
//

import SwiftUI

struct CustomPaths: View {
    var body: some View {
        VStack(alignment: .center) {
            
            Path { path in
                path.move(to: CGPoint(x: 100, y: 50))
                path.addLine(to: CGPoint(x: 50, y: 150))
                path.addLine(to: CGPoint(x: 150, y: 150))
                path.addLine(to: CGPoint(x: 100, y: 50))
            }
            
            HStack {
                
                Path { path in
                    path.move(to: CGPoint(x: 100, y: 50))
                    path.addLine(to: CGPoint(x: 50, y: 150))
                    path.addLine(to: CGPoint(x: 150, y: 150))
                    path.addLine(to: CGPoint(x: 100, y: 50))
                }
                .fill(.blue)
                
                Path { path in
                    path.move(to: CGPoint(x: 100, y: 50))
                    path.addLine(to: CGPoint(x: 50, y: 150))
                    path.addLine(to: CGPoint(x: 150, y: 150))
                    path.addLine(to: CGPoint(x: 100, y: 50))
                }
                .stroke(.blue, lineWidth: 10)
            }
            
            HStack {
                
                Path { path in
                    path.move(to: CGPoint(x: 100, y: 50))
                    path.addLine(to: CGPoint(x: 50, y: 150))
                    path.addLine(to: CGPoint(x: 150, y: 150))
                    path.addLine(to: CGPoint(x: 100, y: 50))
                    path.closeSubpath()
                }
                .stroke(.blue, lineWidth: 10)
                
                Path { path in
                    path.move(to: CGPoint(x: 100, y: 50))
                    path.addLine(to: CGPoint(x: 50, y: 150))
                    path.addLine(to: CGPoint(x: 150, y: 150))
                    path.addLine(to: CGPoint(x: 100, y: 50))
                }
                .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            }
        }
    }
}

struct CustomPaths_Previews: PreviewProvider {
    static var previews: some View {
        CustomPaths()
    }
}
