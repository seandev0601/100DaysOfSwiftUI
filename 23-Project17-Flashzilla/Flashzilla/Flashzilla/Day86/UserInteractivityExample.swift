//
//  UserInteractivityExample.swift
//  Flashzilla
//
//  Created by Po Hsiang Chao on 2023/11/14.
//

import SwiftUI

struct UserInteractivityExample: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Circle tapped!")
                }
                .allowsHitTesting(false)
        }
        .padding(50)
        
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("Word")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    UserInteractivityExample()
}
