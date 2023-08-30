//
//  BookItem.swift
//  Bookworm
//
//  Created by Po Hsiang Chao on 2023/8/30.
//

import SwiftUI

struct BookItem: View {
    let book: Book
    @State private var animating = false
    
    var body: some View {
        HStack {
            if book.rating == 1 {
                EmojiRatingView(rating: book.rating)
                    .font(.largeTitle)
                    .offset(x: -2.5)
                    .offset(x: animating ? 5 : 0)
                    .animation(.default.repeatForever(autoreverses: true), value: animating)
                    .onAppear {
                        if book.rating == 1 {
                            animating = true
                        }
                    }
            } else {
                EmojiRatingView(rating: book.rating)
                    .font(.largeTitle)
            }
            
            VStack(alignment: .leading) {
                Text(book.title ?? "Unknown title")
                    .font(.headline)
                    .foregroundColor(book.rating == 1 ? .red : .black)
                
                Text(book.author ?? "Unknown Author")
                    .foregroundColor(.secondary)
            }
        }
    }
}
