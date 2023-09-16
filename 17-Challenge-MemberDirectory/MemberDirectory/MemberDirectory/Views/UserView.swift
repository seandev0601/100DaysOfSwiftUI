//
//  UserView.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/13.
//

import SwiftUI

struct UserView: View {
    @State var user:CachedUser
    
    var body: some View {
        HStack(alignment: .center) {
            
            Image(systemName: "circle.fill")
                .foregroundColor(user.isActive ? .green : .red)
                .font(.title)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(user.wrappedName)
                        .font(.headline)
                    
                    Text("(\(user.age) age)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                
                Text(user.wrappedEmail)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(3)
    }
}
