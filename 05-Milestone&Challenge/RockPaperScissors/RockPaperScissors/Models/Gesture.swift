//
//  Gesture.swift
//  RockPaperScissors
//
//  Created by Po Hsiang Chao on 2023/7/16.
//

import Foundation

enum Gesture: String, CaseIterable {
    case Rock = "rock"
    case Paper = "paper"
    case Scissors = "scissors"
    
    var emoji: String {
        switch self {
        case .Rock:
            return "✊"
        case .Paper:
            return  "🖐️"
        case .Scissors:
            return "✌️"
        }
    }
}

extension Gesture {
    
    func isWin(of targetGesture: Gesture) -> Bool {
        switch self {
        case .Rock:
            return targetGesture == .Scissors
        case .Paper:
            return targetGesture == .Rock
        case .Scissors:
            return targetGesture == .Paper
        }
    }
    
    func isLose(of targetGesture: Gesture) -> Bool {
        switch self {
        case .Rock:
            return targetGesture == .Paper
        case .Paper:
            return targetGesture == .Scissors
        case .Scissors:
            return targetGesture == .Rock
        }
    }
}


