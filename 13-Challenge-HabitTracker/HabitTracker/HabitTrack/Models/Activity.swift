//
//  Activity.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/16.
//

import Foundation


struct Completion: Codable {
    var completedDate = Date()
    
    var formattedCompletedDate: String {
        completedDate.formatted(date: .abbreviated, time: .shortened)
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(completedDate)
    }
    
    var timeAgoString: String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: completedDate, to: Date())
        
        if let years = components.year, years > 0 {
            return "\(years) y"
        } else if let months = components.month, months > 0 {
            return "\(months) m"
        } else if let days = components.day, days > 0 {
            return "\(days) d"
        } else if let hours = components.hour, hours > 0 {
            return "\(hours) h"
        } else if let minutes = components.minute, minutes > 0 {
            return "\(minutes) min"
        } else if let seconds = components.second, seconds > 0 {
            return "\(seconds) s"
        } else {
            return "0 s"
        }
    }
}

struct Activity: Codable, Identifiable {
    
    var id = UUID()
    let title: String
    let description: String
    var completions: [Completion]
    let iconName: String
    let iconColor: String
    
    var completionCount: Int {
        completions.count
    }
    
}
