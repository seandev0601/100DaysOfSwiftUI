//
//  SettingView.swift
//  MultiplicationGame
//
//  Created by Po Hsiang Chao on 2023/7/25.
//

import SwiftUI

struct SettingView: View {
    
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
                    
                    Stepper(value: $multiplicationNumber, in: 2...12, step: 1) {
                        HStack {
                            Spacer()
                            Text("✖")
                                .font(.largeTitle)
                            NumberImage(multiplicationNumber)
                                .padding(.trailing, 30)
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
                    generateQuestions()
                } label: {
                    Image("cat_go")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(50)
                        .background(.yellow)
                        .clipShape(Ellipse())
                }
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
