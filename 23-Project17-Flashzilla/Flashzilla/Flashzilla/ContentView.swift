//
//  ContentView.swift
//  Flashzilla
//
//  Created by Po Hsiang Chao on 2023/11/8.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @State private var cards = [Card]()
    
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    @State private var showingEditScreen = false
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    ForEach(cards) { card in
                        CardView(card: card) { isCorrect in
                            withAnimation {
                                moveCard(card, isCorrect: isCorrect)
                            }
                        }
                        .stacked(at: findIndex(of: card), in: cards.count)
                        .allowsHitTesting(findIndex(of: card) == cards.count - 1)
                        .accessibilityHidden(findIndex(of: card) < cards.count - 1)
                        
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                .offset(y: 20)
                
                if cards.isEmpty {
                    Spacer()
                    Button("Start Again", action: resetCards)
                        .font(.title)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                    Spacer()
                }
            }
            
            if differentiateWithoutColor || voiceOverEnabled {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being incorrect.")
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .overlay(alignment: .top) {
            Text("Time: \(timeRemaining)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(.black)
                .clipShape(Capsule())
                .padding()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                showingEditScreen = true
            } label: {
                Image(systemName: "plus.circle")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .background(.black.opacity(0.7))
                    .clipShape(Circle())
            }
            .padding()
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)
        .onAppear(perform: resetCards)
    }
    
    func findIndex(of card: Card) -> Int {
        cards.firstIndex(where: { $0.id == card.id }) ?? 0
    }
    
    func moveCard(_ card: Card, isCorrect: Bool) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        removeCard(at: index)
        
        if isCorrect == false {
            let reCard = Card(prompt: card.prompt, answer: card.answer)
            cards.insert(reCard, at: 0)
        }
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData()
    }
    
    func loadData() {
        let storage = FileStorage()
        cards = storage.loadData()
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x:0, y: offset * 10)
    }
}

#Preview {
    ContentView()
}
