//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Po Hsiang Chao on 2023/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var questions = [Question]()
    @State private var questionNumber = 0
    
    @State private var playingGame = false
    
    var body: some View {
        VStack {
            if playingGame {
                
                GameView(questions: self.questions, questionNumber: self.questionNumber) {
                    self.playingGame = false
                }
                
            } else {
                SettingView { questionNumber, questions in
                    self.questionNumber = questionNumber
                    self.questions = questions
                    self.playingGame = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
