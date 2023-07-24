//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Po Hsiang Chao on 2023/7/12.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingReset = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var round = 1
    @State private var alertMessage = ""
    
    @State private var selectFlag = -1
    @State private var animationAmount = 0.0
    @State private var animationOpacity = 1.0
    @State private var animationRadius = 0.0
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text("Round \(round)")
                    .font(.headline)
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(countries[number])
                                .opacity(selectFlag != number ? animationOpacity : 1.0)
                                .blur(radius: selectFlag != number ? animationRadius : 0.0)
                                .rotation3DEffect(.degrees(selectFlag == number ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(alertMessage)
        }
        .alert(scoreTitle, isPresented: $showingReset) {
            Button("Play again", action: resetGame)
        } message: {
            Text(alertMessage)
        }
    }
    
    func flagTapped(_ number:Int) {
        selectFlag = number
        withAnimation {
            animationAmount = 360
        }
        withAnimation {
            animationOpacity = 0.25
            animationRadius = 5.0
        }
        if number == correctAnswer {
            scoreTitle = "Round \(round) - Correct"
            score += 1
            alertMessage = "Your score is \(score)."
        } else {
            scoreTitle = "Round \(round) - Wrong"
            alertMessage = "Wrong! That’s the flag of \(countries[number])."
        }
        
        if round == 8 {
            showingReset = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        round += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectFlag = -1
        animationAmount = 0
        animationOpacity = 1.0
        animationRadius = 0.0
    }
    
    func resetGame() {
        round = 1
        score = 0
        selectFlag = -1
        animationAmount = 0
        animationOpacity = 1.0
        animationRadius = 0.0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
