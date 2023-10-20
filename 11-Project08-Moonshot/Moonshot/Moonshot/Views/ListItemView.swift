//
//  ListItem.swift
//  Moonshot
//
//  Created by Po Hsiang Chao on 2023/8/4.
//

import SwiftUI

struct ListItemView: View {
    let imageName: String
    let name: String
    let date: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
                .frame(maxHeight: .infinity)
                .background(.lightBackground)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text(date)
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.horizontal)
            
            Spacer()
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

