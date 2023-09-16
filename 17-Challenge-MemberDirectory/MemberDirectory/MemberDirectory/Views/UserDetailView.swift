//
//  UserDetailView.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/13.
//

import SwiftUI

struct UserDetailView: View {
    @State var user: CachedUser
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("**Active**")
                            Image(systemName: "circle.fill")
                                .foregroundColor(user.isActive ? .green : .red)
                        }
                        .padding(.bottom, 2)
                        
                        Text("**Registered**\n\(user.wrappedRegistered)")
                            .padding(.bottom, 2)
                        
                        Text("**Age**\n\(user.age)")
                            .padding(.bottom, 2)
                        Text("**Company**\n\(user.wrappedCompany)")
                            .padding(.bottom, 2)
                        Text("**Email**\n\(user.wrappedEmail)")
                            .padding(.bottom, 2)
                        
                        Text("**Address**\n\(user.wrappedAddress)")
                            .padding(.bottom, 5)
                    }
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.secondary)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        Text("Tags")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum:150, maximum: 200))
                        ], alignment: .leading) {
                            ForEach(user.wrappedTags, id: \.self) { tag in
                                Text("#\(tag)")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.secondary)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        Text("Friend")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum:150, maximum: 200))
                        ], alignment: .leading) {
                            ForEach(user.wrappedFriends, id: \.id) { friend in
                                Text(friend.wrappedName)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(5)
                                    .border(.black)
                            }
                        }
                    }
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.secondary)
                        .padding(.vertical)

                    
                    Text("About")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(user.wrappedAbout)
                }
                .padding(.horizontal)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
        .background(
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .bottomLeading, endPoint: .topTrailing)
        )
    }
}
