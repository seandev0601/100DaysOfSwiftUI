//
//  ContentView.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/13.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.isActive, order: .reverse),
        SortDescriptor(\.name)
    ], predicate: nil) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    UserView(user: user)
                }
            }
            .onAppear {
                Task {
                    await loadData()
                }
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
                let users = decodedResponse
                
                Task {
                    await MainActor.run {
                        storeCoreData(users: users)
                    }
                }
            }
        } catch {
            print("Invalid data: \(error.localizedDescription)")
        }
    }
    
    func storeCoreData(users: [User]) {
        for user in users {
            let cachedUser = CachedUser(context: moc)
            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.email = user.email
            cachedUser.company = user.company
            cachedUser.about = user.about
            cachedUser.tags = user.tags.joined(separator: ",")
                        
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                
                cachedUser.addToFriends(cachedFriend)
            }
        }
        
        if self.moc.hasChanges {
            do {
                try self.moc.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
