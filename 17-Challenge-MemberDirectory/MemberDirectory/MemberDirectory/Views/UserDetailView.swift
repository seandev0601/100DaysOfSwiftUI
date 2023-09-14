//
//  UserDetailView.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/13.
//

import SwiftUI

struct UserDetailView: View {
    @State var user: User
    
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
                        
                        Text("**Registered**\n\(user.formattedRegistered)")
                            .padding(.bottom, 2)
                        
                        Text("**Age**\n\(user.age)")
                            .padding(.bottom, 2)
                        Text("**Company**\n\(user.company)")
                            .padding(.bottom, 2)
                        Text("**Email**\n\(user.email)")
                            .padding(.bottom, 2)
                        
                        Text("**Address**\n\(user.address)")
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
                            ForEach(user.tags, id: \.self) { tag in
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
                            ForEach(user.friends, id: \.id) { friend in
                                Text(friend.name)
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
                    
                    Text(user.about)
                }
                .padding(.horizontal)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .bottomLeading, endPoint: .topTrailing)
        )
    }
}

struct UserDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            UserDetailView(user: User.sample)
        }
    }
}
