//
//  IconColor.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/16.
//

import SwiftUI

enum AppColor: CaseIterable {
    case red
    case green
    case blue
    case yellow
    case purple
    
    var color: Color {
        switch self {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .blue:
            return Color.blue
        case .yellow:
            return Color.yellow
        case .purple:
            return Color.purple
        }
    }
    
    var hexString: String {
        self.color.toHex()
    }
}
