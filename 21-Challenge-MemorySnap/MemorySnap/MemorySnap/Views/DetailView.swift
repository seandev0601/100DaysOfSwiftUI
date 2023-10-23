//
//  UserDetailView.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import SwiftUI

struct DetailView: View {
    @State var user: User
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .top, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            user.image?
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DetailView()
//}
