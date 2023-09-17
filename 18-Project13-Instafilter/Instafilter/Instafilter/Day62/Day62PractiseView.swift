//
//  Day62PractiseView.swift
//  Instafilter
//
//  Created by Po Hsiang Chao on 2023/9/17.
//

import SwiftUI

struct Day62PractiseView: View {
    @State private var blurAmount = 0.0
    @State private var radiusAmount = 0.0
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.gray
    
    var body: some View {
        VStack {
            Text("Hello, Day 62!")
                .frame(width: 300, height: 300)
                .blur(radius: blurAmount)
                .background(backgroundColor)
                .cornerRadius(radiusAmount)
                .animation(.default, value: blurAmount)
                .animation(.default, value: backgroundColor)
                .animation(.default, value: radiusAmount)
                .padding()
                .onTapGesture {
                    showingConfirmation = true
                }
                .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                    Button("Red") { backgroundColor = .red }
                    Button("Green") { backgroundColor = .green }
                    Button("Blue") { backgroundColor = .blue }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Select a new color")
                }

            Slider(value: $blurAmount, in: 0...20)
                
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
        .onChange(of: blurAmount) { newValue in
            print("New value is \(newValue)")
            radiusAmount = newValue * 3
        }
    }
}

struct Day62PractiseView_Previews: PreviewProvider {
    static var previews: some View {
        Day62PractiseView()
    }
}
