//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Po Hsiang Chao on 2023/7/15.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            MottoView()

            Button("Hello World") {
                print(type(of: self.body))
                useRedText.toggle()
            }
            .titleStyle()
            .foregroundColor(useRedText ? .red : .white)

            HStack(spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundColor(.white)
                CapsuleText(text: "Second")
                    .foregroundColor(.yellow)
            }
            
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")

            GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
