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

struct AnswerMark: ViewModifier {
    
    var answer: Answer
    var isHidden: Bool
    
    var symbol: String {
        switch answer {
        case .correct:
            return "checkmark.circle.fill"
        case .incorrect:
            return "xmark.circle.fill"
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
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            if !isHidden {
                Image(systemName: symbol)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(color)
                    .background(answer == .none ? nil : Circle().foregroundColor(.white))
                    .frame(width: 30, height: 30)
            }
        }
    }
}

extension View {
    func answer(with answer: Answer, isHidden: Bool = false) -> some View {
        self.modifier(AnswerMark(answer: answer, isHidden: isHidden))
    }
}


struct AnswerMark_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NumberImage(1, type: .fill, size: 80)
                .answer(with: .none)
            
            NumberImage(1, type: .fill, size: 80)
                .answer(with: .correct, isHidden: false)
            
            NumberImage(1, type: .fill, size: 80)
                .answer(with: .incorrect, isHidden: false)
        }
    }
}
