//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/16.
//

import SwiftUI

struct ActivityDetailView: View {
    @StateObject var activities: Activities
    var id: UUID
    var activity: Activity! {
        activities.getActivity(id: id)
    }
    
    var body: some View {
        if activity == nil {
            Text("Not found")
        } else {
            NavigationView {
                ZStack {
                    
                    Color.customBlue
                    .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(activity.title)
                                    .font(.title.bold())
                                
                                Text(activity.description)
                                
                                Text("Complection count : \(activity.completionCount)")
                            }
                            Spacer()
                        }
                        .padding()
                        
                        if activity.completions.count > 0 {
                            ScrollView {
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Completion time")
                                            .font(.title.bold())
                                            .padding(.bottom, 20)
                                        
                                        ForEach(activity.completions, id: \.completedDate) { data in
                                            Text(data.formattedCompletedDate)
                                            Rectangle()
                                                .frame(height: 2)
                                                .foregroundColor(.black)
                                                .opacity(0.2)
                                        }
                                    }
                                    .padding()
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            .padding()
                        }
                        
                        Spacer()
                        
                        ZStack(alignment: .bottomTrailing) {
                            Button {
                                addCompletion()
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 100, height: 100)
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.blue)
                                        .font(.largeTitle)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func addCompletion() {
        activities.addCompletion(id: id)
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities()
        ActivityDetailView(activities: activities, id: activities.items[0].id)
    }
}
