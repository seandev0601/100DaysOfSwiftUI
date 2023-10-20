//
//  GridItem.swift
//  Moonshot
//
//  Created by Po Hsiang Chao on 2023/8/4.
//

import SwiftUI

struct GridItemView: View {
    let imageName: String
    let name: String
    let date: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(date)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(name)
        .accessibilityHint(date)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}
