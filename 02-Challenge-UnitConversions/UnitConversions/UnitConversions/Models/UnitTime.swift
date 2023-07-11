//
//  Time.swift
//  UnitConversions
//
//  Created by Po Hsiang Chao on 2023/7/11.
//

import Foundation

enum UnitTime: String, CaseIterable, Identifiable {
    case seconds, minutes, hours, days
    
    var id: String { rawValue }
    
    var symbol: String {
        switch self {
        case .seconds:
            return "s"
        case .minutes:
            return "min"
        case .hours:
            return "h"
        case .days:
            return "d"
        }
    }
}

extension UnitTime {
    
    func convertToSeconds(of number: Double) -> Double {
        switch self {
        case .seconds:
            return number
        case .minutes:
            return number * 60
        case .hours:
            return number * 60 * 60
        case .days:
            return  number * 60 * 60 * 24
        }
    }
    
    func converted(of seconds: Double) -> Double {
        switch self {
        case .seconds:
            return seconds
        case .minutes:
            return seconds / 60
        case .hours:
            return seconds / 60 / 60
        case .days:
            return  seconds / 60 / 60 / 24
        }
    }
}
