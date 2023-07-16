//
//  ProminentTitle.swift
//  ViewsAndModifiers
//
//  Created by Po Hsiang Chao on 2023/7/16.
//

import SwiftUI

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func prominentTitle() -> some View {
        self.modifier(ProminentTitle())
    }
}
