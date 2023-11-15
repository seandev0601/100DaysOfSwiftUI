//
//  TimerView.swift
//  Flashzilla
//
//  Created by Po Hsiang Chao on 2023/11/15.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct TimerView: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.scenePhase) var scenePhase
    
    @State private var timer = Timer.publish(every: 1, tolerance: 0.5,on: .main, in: .common).autoconnect()
    @State private var elapsedSeconds = 0
    @State private var isStoped = false
    
    @State private var scale = 1.0
    
    
    var timeString: String {
        let minutes = (elapsedSeconds % 3600) / 60
        let seconds = (elapsedSeconds % 3600) % 60

        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(reduceTransparency ? .black : .black.opacity(0.75), lineWidth: 2)
                .frame(width: 100, height: 100)
            
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [4]))
                .frame(width: 220, height: 220)
                
            
            Text(timeString)
                .foregroundColor(.primary)
                .font(.system(size: 20, weight: .light, design: .monospaced))
                .scaleEffect(scale)
                .onReceive(timer) { time in
                    elapsedSeconds += 1
                }
            
            if isStoped {
                Button {
                    timer = Timer.publish(every: 1, tolerance: 0.5,on: .main, in: .common).autoconnect()
                    isStoped = false
                } label: {
                    Image(systemName: "play.circle")
                        .font(.largeTitle)
                        .clipShape(Circle())
                        .padding(.top, 150)
                }
                .tint(.black)
            }
        }
        .onChange(of: timeString) {
            withOptionalAnimation {
                scale = (elapsedSeconds % 2 == 0) ? 1.0 : 1.2
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .background {
                timer.upstream.connect().cancel()
                isStoped = true
            }
        }
    }
}

#Preview {
    TimerView()
}
