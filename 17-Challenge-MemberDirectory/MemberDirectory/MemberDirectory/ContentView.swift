//
//  ContentView.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/13.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    UserView(user: user)
                }
            }
            .task {
                await loadData()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: .bottomTrailing, endPoint: .topLeading)
            )
            .scrollContentBackground(.hidden)
            .navigationTitle("Members")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    func loadData() async {
        if !users.isEmpty {
            print("Hava data")
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
                
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid data: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
