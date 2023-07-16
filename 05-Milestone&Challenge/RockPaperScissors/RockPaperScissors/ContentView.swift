//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Po Hsiang Chao on 2023/7/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var choices: [Gesture] = [.Rock, .Paper, .Scissors].shuffled()
    @State private var score = 0
    @State private var round = 1
    @State private var currentGesture: Gesture = Gesture.allCases.randomElement()!
    @State private var shouldWin: Bool = Bool.random()
    @State private var showingResultAlert = false
    @State private var showingGameOverAlert = false
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var promptText: some View {
        if shouldWin {
            return Text("You have to \(Text("win").foregroundColor(.red)) the game")
                .font(.headline)
                .foregroundColor(.white)
        } else {
            return Text("You have to \(Text("lose").foregroundColor(.green)) the game")
                .font(.headline)
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(stops: [
                .init(color: .purple, location: 0.3),
                .init(color: .indigo, location: 0.7)
            ], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Brain Game")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("Round \(round)")
                    .font(.headline)
                    .foregroundColor(.white)
                
                VStack {
                    Text(currentGesture.emoji)
                        .font(.system(size: 125))
                    
                    promptText
                    
                    HStack {
                        ForEach(choices, id: \.self) { gesture in
                            Button {
                                gestureTapped(gesture)
                            } label: {
                                Text(gesture.emoji)
                                    .font(.system(size: 80))
                            }
                        }
                    }
                    .padding(.top, 30)
                    .alert(alertTitle, isPresented: $showingResultAlert) {
                        Button("Continue", action: askQuestion)
                    } message: {
                        Text(alertMessage)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
            }
            .padding()
        }
        .alert(alertTitle, isPresented: $showingGameOverAlert) {
            Button("Play again", action: resetGame)
        } message: {
            Text(alertMessage)
        }
    }
    
    
    func gestureTapped(_ playerGesture: Gesture) {
        
        let isCorrect = shouldWin ? playerGesture.isWin(of: currentGesture) : playerGesture.isLose(of: currentGesture)
        
        alertTitle = isCorrect ? "Correct" : "Incorrect"
        alertMessage = "You choice \(playerGesture.rawValue).\n"
        if isCorrect {
            score += 1
            alertMessage += "Correct! Get point!"
        } else {
            score > 0 ? (score -= 1) : (score = 0)
            alertMessage += "Incorrect! Lose point!"
        }
        
        
        showingResultAlert = true
    }
    
    func askQuestion() {
        if round == 10 {
            alertTitle = "Game over!"
            alertMessage = "Your final score is \(score)"
            showingGameOverAlert = true
            return
        }
        
        round += 1
        shouldWin.toggle()
        currentGesture = Gesture.allCases.randomElement()!
        choices.shuffle()
    }
    
    func resetGame() {
        score = 0
        round = 1
        shouldWin = Bool.random()
        currentGesture = Gesture.allCases.randomElement()!
        choices.shuffle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
