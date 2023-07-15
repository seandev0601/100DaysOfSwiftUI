//
//  MottoView.swift
//  ViewsAndModifiers
//
//  Created by Po Hsiang Chao on 2023/7/15.
//

import SwiftUI

struct MottoView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")

    var body: some View {
        VStack {
            VStack {
                motto1
                    .foregroundColor(.red)
                motto2
                    .foregroundColor(.blue)
            }
        }
    }
}
