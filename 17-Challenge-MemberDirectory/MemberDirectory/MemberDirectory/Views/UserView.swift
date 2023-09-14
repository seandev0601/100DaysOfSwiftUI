//
//  UserView.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/13.
//

import SwiftUI

struct UserView: View {
    @State var user: User
    
    var body: some View {
        HStack(alignment: .center) {
            
            Image(systemName: "circle.fill")
                .foregroundColor(user.isActive ? .green : .red)
                .font(.title)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(user.name)
                        .font(.headline)
                    
                    Text("(\(user.age) age)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                
                Text(user.email)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(3)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User.sample)
    }
}
