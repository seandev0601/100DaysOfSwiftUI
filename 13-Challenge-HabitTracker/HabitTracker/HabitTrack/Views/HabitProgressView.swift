//
//  ProgressView.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/18.
//

import SwiftUI

struct HabitProgressView: View {
    @ObservedObject var activities: Activities
    
    var activityCount: Int {
        activities.items.count
    }
    
    var doneCount: Int {
        var count = 0
        for activity in activities.items {
            if let completion = activity.completions.first, completion.isToday {
                count += 1
            }
        }

        return count
    }
    
    var waitCount: Int {
        var count = 0
        for activity in activities.items {
            if activity.completions.count == 0 {
                count += 1
            } else if let completion = activity.completions.first,
               completion.isToday == false  {
                count += 1
            }
        }

        return count
    }

    
    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                Arc(endAngle: .degrees(360))
                    .stroke(Color.customBlue.opacity(0.3), lineWidth: 10)
                    .frame(width: 100, height: 100)
                
                Arc(progress: Double(doneCount)/Double(activityCount))
                    .stroke(.blue, lineWidth: 10)
                    .frame(width: 100, height: 100)
                
                Text("\(doneCount) / \(activityCount)")
                    .font(.title.bold())
                    .foregroundColor(.blue)
                
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Today habit")
                    .font(.title)
                
                Text("Done: \(doneCount)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                
                Text("Wait:  \(waitCount)")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct HabitProgressView_Previews: PreviewProvider {
    static var previews: some View {
        HabitProgressView(activities: Activities())
    }
}
