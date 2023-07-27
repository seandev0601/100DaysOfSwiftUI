//
//  GameView.swift
//  MultiplicationGame
//
//  Created by Po Hsiang Chao on 2023/7/26.
//

import SwiftUI

struct GameView: View {
    
    @State var questions:[Question]
    @State var questionNumber: Int
    @State private var round = 1
    
    @State private var score = 0
    @State private var correctCount = 0
    @State private var incorrectCount = 0
    @State private var answered = false
    @State private var showingGameOverAlert = false
    
    
    @State private var answerResult: Answer = .none
    @State private var animationAmount = 0.0
    
    var resetGame: () -> Void
    
    var currentQuestion: Question {
        questions[round - 1]
    }
    
    var firstNumber: Int {
        currentQuestion.multiplicationNumber
    }
    
    var secondNumber: Int {
        currentQuestion.operand
    }
    
    var options: [Int] {
        currentQuestion.options
    }
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Text("Question \(round) / \(questionNumber)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack {
                    Text("Tap your answer")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    HStack {
                        NumberImage(firstNumber, color: .black)
                        
                        Text("✖")
                            .font(.largeTitle)
                        
                        NumberImage(secondNumber, color: .black)
                        
                        Text("🟰")
                            .font(.largeTitle)
                    }
                    .padding(.bottom, 30)
                    
                    HStack(spacing: 30) {
                        ForEach(options, id: \.self) { option in
                            
                            ZStack {
                                Button {
                                    checkAnswer(option)
                                } label: {
                                    NumberImage(option, type: .fill, size: 80)
                                        .answer(with: currentQuestion.answer == option ? .correct : .incorrect,
                                                isHidden: !answered)
                                }
                                .disabled(answered)
                            }
                        }
                    }
                    
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Button {
                    askQuestion()
                } label: {
                    Text("Next")
                        .font(.largeTitle)
                        .foregroundColor(answered ? .white : .gray)
                        .shadow(radius: 1)
                }
                .disabled(answered == false)
                .alert("Game Over!", isPresented: $showingGameOverAlert) {
                    Button("Play again", action: reset)
                } message: {
                    Text("Your total score is \(score).\nStart new game?")
                }
                
                HStack(alignment:.center, spacing: 30) {
                    VStack {
                        Text("\(correctCount)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.bottom, -5)
                        Image("cat_correct")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .shadow(radius: 5)
                    }
                    .rotation3DEffect(.degrees(answerResult == .correct ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                    
                    VStack {
                        Text("\(score)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.bottom, -5)
                        Image("cat_score")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .shadow(radius: 5)
                    }
                    .rotation3DEffect(.degrees(answerResult == .correct ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                    
                    VStack {
                        Text("\(incorrectCount)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.bottom, -5)
                        Image("cat_incorrect")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .shadow(radius: 5)
                    }
                    .rotation3DEffect(.degrees(answerResult == .incorrect ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                }
                .padding()
                
                Spacer()
            }
            .padding(20)
        }
    }
    
    func checkAnswer(_ selectOption: Int) {
        answered = true
        if selectOption == currentQuestion.answer {
            score += 10
            correctCount += 1
            answerResult = .correct
        } else {
            incorrectCount += 1
            answerResult = .incorrect
        }
        
        withAnimation {
            animationAmount = 360
        }
    }
    
    func askQuestion() {
        answered = false
        answerResult = .none
        
        if round < questionNumber {
            round += 1
        } else {
            showingGameOverAlert = true
        }
        
        animationAmount = 0
        
    }
    
    func reset() {
        resetGame()
        round = 1
        score = 0
        correctCount = 0
        incorrectCount = 0
        answered = false
        answerResult = .none
        animationAmount = 0
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(questions: [
            Question(multiplicationNumber: 2, operand: 6),
            Question(multiplicationNumber: 2, operand: 10),
            Question(multiplicationNumber: 2, operand: 7),
            Question(multiplicationNumber: 2, operand: 8),
            Question(multiplicationNumber: 2, operand: 5),
        ], questionNumber: 5) {
            
        }
    }
}
