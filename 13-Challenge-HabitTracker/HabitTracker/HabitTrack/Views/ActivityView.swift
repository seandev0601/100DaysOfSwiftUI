//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/16.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activities: Activities
    @State private var timer: Timer?
    @State private var timeAgoString = ""
    @State var id: UUID

    var activity: Activity! {
        return activities.getActivity(id: id)
    }

    
    var body: some View {
        if activity != nil {
            HStack {
                Image(systemName: "\(activity.iconName).fill")
                    .imageScale(.large)
                    .foregroundColor(Color(hexString: activity.iconColor))
                    .padding([.trailing], 3)
                
                VStack(alignment: .leading) {
                    Text("\(activity.title) (\(activity.completions.count))")
                        .font(.headline)
                    Text(activity.description)
                        .font(.subheadline)
                }
                
                Spacer()
                
                if activity.completions.count > 0 {
                    HStack(alignment: .bottom) {
                        Text(timeAgoString)
                            .font(.caption)
                            .onAppear {
                                startTimer()
                            }
                            .onDisappear {
                                stopTimer()
                            }
                        Text("ago")
                            .font(.caption)
                            .padding(.trailing)
                    }
                    .offset(x:0 , y: 10)
                    
                }
            }
        }
    }
    
    func startTimer() {
        updateTimeString()
        
        // Start a timer to refresh the view every second
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            // Update the completion's timeAgoString property
            updateTimeString()
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateTimeString() {
        guard let timeString = activity.completions.first?.timeAgoString else { return }
        timeAgoString = timeString
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities()
        let id = activities.items[0].id
        
        ActivityView(activities: activities, id: id)
    }
}
