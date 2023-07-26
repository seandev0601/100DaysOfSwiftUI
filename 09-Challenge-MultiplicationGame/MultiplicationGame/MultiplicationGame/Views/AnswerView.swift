//
//  Answer.swift
//  MultiplicationGame
//
//  Created by Po Hsiang Chao on 2023/7/26.
//

import SwiftUI

enum Answer {
    case none
    case correct
    case incorrect
}

struct AnswerView: View {
    var answer: Answer
    
    var symbol: String {
        switch answer {
        case .correct:
            return "checkmark"
        case .incorrect:
            return "xmark"
        default:
            return ""
        }
    }
    
    var color: Color {
        switch answer {
        case .correct:
            return .red
        case .incorrect:
            return .green
        default:
            return .white
        }
    }
    
    init(_ answer: Answer) {
        self.answer = answer
    }
    
    var body: some View {
        Image(systemName: symbol)
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
            .frame(width: 30, height: 30)
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AnswerView(.none)
            AnswerView(.correct)
            AnswerView(.incorrect)
        }
    }
}
