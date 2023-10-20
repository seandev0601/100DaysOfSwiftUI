//
//  CrewMember.swift
//  Moonshot
//
//  Created by Po Hsiang Chao on 2023/8/4.
//
import SwiftUI

struct CrewMemberView: View {
    let imageName: String
    let name: String
    let role: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .accessibilityHidden(true)
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.white)
                    .font(.headline)
                
                Text(role)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .accessibilityElement(children: .combine)
        }
    }
}

struct CrewMemberView_Previews : PreviewProvider {
    static var previews: some View {
        CrewMemberView(imageName: "aldrin", name:"aldrin" , role: "Commander")
    }
}
