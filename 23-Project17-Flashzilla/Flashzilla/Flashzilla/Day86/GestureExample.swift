//
//  GestureExample.swift
//  Flashzilla
//
//  Created by Po Hsiang Chao on 2023/11/14.
//

import SwiftUI

struct GestureExample: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    @State private var currentAngleAmount = Angle.zero
    @State private var finalAngleAmount = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        Text("LongPressGesture!")
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progres: \(inProgress)")
            }
            .padding(50)
        
        Text("Hello, MagnificationGesture!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
                )
            .padding(50)
        
        Text("Hello, RotationGesture!")
            .rotationEffect(currentAngleAmount + finalAngleAmount)
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        currentAngleAmount = angle
                    }
                    .onEnded { angle in
                        finalAngleAmount += currentAngleAmount
                        currentAngleAmount = .zero
                    }
            )
        
        VStack {
            Text("Hello, highPriority Gesture!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .highPriorityGesture(TapGesture()
            .onEnded{ _ in
                print("VStack tapped")
            })
        .padding(50)
        
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { _ in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1.0)
            .offset(offset)
            .gesture(combined)
        Spacer()
    }
}

#Preview {
    GestureExample()
}
