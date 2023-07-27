//
//  SettingView.swift
//  MultiplicationGame
//
//  Created by Po Hsiang Chao on 2023/7/25.
//

import SwiftUI

struct SettingView: View {
    
    @State private var animationAmount =  1.0
    @State private var animationEnabled = false
    @State private var animationScale = 1.0
    @State private var multiplicationNumber = 2
    @State private var questionNumber = 5
    let questions = [5, 10, 20]
    
    @State private var allQuestions = [Question]()
    
    var play: (_ questionNumber: Int,  _ questions: [Question]) -> Void
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Text("Multiplication Game")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Select a multiplication table:")
                        .font(.headline)
                    
                    Stepper(value: $multiplicationNumber, in: 2...12, step: 1, onEditingChanged: { bool in
                        animationEnabled = bool
                    }) {
                        HStack {
                            Spacer()
                            Text("✖")
                                .font(.largeTitle)
                            
                            NumberImage(multiplicationNumber)
                                .padding(.trailing, 30)
                                .scaleEffect(animationEnabled ? 1 : 1.1)
                                .animation(.linear(duration: 0.1), value: animationEnabled)
                        }
                    }
                    .padding(.trailing, 45)
                
                    
                    Text("How many questions?")
                        .font(.headline)
                        .padding(.top,50)
                    
                    Picker("Number of questions", selection: $questionNumber) {
                        ForEach(questions, id: \.self) {
                            Text("\($0)")
                                .font(.largeTitle)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.bottom,30)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Spacer()
                Spacer()
                
                Button() {
                    withAnimation(.linear(duration: 1.5)) {
                        animationScale = 10.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        print("Animation finished")
                        generateQuestions()
                    }
                } label: {
                    Image("cat_go")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(50)
                        .background(.yellow)
                        .clipShape(Ellipse())
                        .overlay(
                            Circle()
                                .strokeBorder(.yellow, lineWidth: 3)
                                .scaleEffect(animationAmount)
                                .opacity(2 - animationAmount)
                                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
                        )
                        .onAppear {
                            animationAmount = 2
                        }
                }
                .scaleEffect(animationScale)
                .offset(y: animationScale != 1 ? -400 : 0)
            }
            .padding(20)
        }
        
    }
    
    func generateQuestions() {
        allQuestions.removeAll()
        
        for _ in 1...questionNumber {
            let question = Question(multiplicationNumber: multiplicationNumber, operand: Int.random(in: 1...12))
            allQuestions.append(question)
        }
        
        play(questionNumber, allQuestions)
        animationScale = 1
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        
        SettingView { questionNumber, questions in
            print("\(questionNumber)")
            print("\(questions)")
        }
    }
}
