//
//  ContentView.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                HabitProgressView(activities: activities)
                
                Section {
                    ForEach(activities.heartItems) { item in
                        NavigationLink {
                            ActivityDetailView(activities: activities, id: item.id)
                        } label: {
                            ActivityView(activities: activities, id: item.id)
                        }
                    }
                    .onDelete(perform: removeHeartItems)
                }
                
                Section {
                    ForEach(activities.starItems) { item in
                        NavigationLink {
                            ActivityDetailView(activities: activities, id: item.id)
                        } label: {
                            ActivityView(activities: activities, id: item.id)
                        }
                    }
                    .onDelete(perform: removeStarItems)
                }
                
                Section {
                    ForEach(activities.circleItems) { item in
                        NavigationLink {
                            ActivityDetailView(activities: activities, id: item.id)
                        } label: {                            ActivityView(activities: activities, id: item.id)
                        }
                    }
                    .onDelete(perform: removeCircleItems)
                }
            }
            .background(Color.customBlue)
            .scrollContentBackground(.hidden)
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showAddActivity = true
                } label: {
                    Text("Add Activity")
                        .font(.headline)
                }
            }
            .sheet(isPresented: $showAddActivity) {
                AddActivityView(activities: activities)
            }
        }
    }
    
    func removeHeartItems(at offsets: IndexSet) {
        let item = activities.heartItems[offsets.first!]
        removeItems(of: item)
    }
    
    func removeStarItems(at offsets: IndexSet) {
        let item = activities.starItems[offsets.first!]
        removeItems(of: item)
    }
    
    func removeCircleItems(at offsets: IndexSet) {
        let item = activities.circleItems[offsets.first!]
        removeItems(of: item)
    }
    
    func removeItems(of item: Activity) {
        if let index = activities.items.firstIndex(where: { $0.id == item.id }) {
            activities.items.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
