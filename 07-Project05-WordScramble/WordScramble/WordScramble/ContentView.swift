//
//  ContentView.swift
//  WordScramble
//
//  Created by Po Hsiang Chao on 2023/7/20.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Text(rootWord)
                        .font(.headline)
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                                Spacer()
                                Text("+ \(1 + word.count)")
                                    .foregroundColor(.green)
                            }
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel(word)
                            .accessibilityHint("\(word.count) letters")
                        }
                    }
                }
                
                Spacer()
                
                Text("Your score is \(score)")
                        .font(.largeTitle)
            }
            .navigationTitle("Word Scramble")
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .toolbar {
                Button("Restart", action: startGame)
            }
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { clearWord() }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func clearWord() {
        newWord = ""
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        // Extra validation to come
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isLong(word: answer) else {
            wordError(title: "Word not possible", message: "It is less than 3 characters.")
            return
        }
        
        guard isDifferent(word: answer) else {
            wordError(title: "Word not possible", message: "It is the same as the root word.")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        self.score += 1
        self.score += answer.count
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                score = 0
                usedWords.removeAll()
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isLong(word: String) -> Bool {
        word.count >= 3
    }

    func isDifferent(word: String) -> Bool {
        rootWord != word
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
