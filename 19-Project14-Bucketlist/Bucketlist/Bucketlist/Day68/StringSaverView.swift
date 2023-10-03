//
//  StringSaverView.swift
//  Bucketlist
//
//  Created by Po Hsiang Chao on 2023/10/3.
//

import SwiftUI

struct StringSaverView: View {
    @State private var inputText: String = ""
    @State private var savedStrings: [SavedString] = []
    @State private var appState: AppState = .input
    
    var body: some View {
        NavigationView {
            VStack {
                if appState == .input {
                    TextField("Enter a string", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.black)
                        .padding()
                    
                    Button("Save") {
                        saveString()
                    }
                    Text("Saved: \(savedStrings.count)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding()
                    
                    Spacer()
                } else {
                    StringListView(strings: savedStrings)
                }
            }
            .onAppear {
                loadSavedStrings()
            }
            .navigationTitle("String Saver")
            .navigationBarItems(trailing:
                Button(action: {
                    toggleAppState()
                }) {
                    Text(appState == .input ? "Show List" : "Input String")
                        .foregroundColor(.blue)
                }
            )
        }
    }
    
    func toggleAppState() {
        appState = appState == .input ? .list : .input
    }
    
    func saveString() {
        guard !inputText.isEmpty else { return }
        let savedString = SavedString(value: inputText)
        savedStrings.append(savedString)
        savedStrings.sort()
        inputText = ""
        
        // Get the path to the Documents Directory
        let fileURL = getDocumentsDirectory().appendingPathComponent("savedStrings.txt")
        do {
            // Convert savedStrings array to a JSON data and write to the file
            let data = try JSONEncoder().encode(savedStrings)
            try data.write(to: fileURL)
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    
    func loadSavedStrings() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("savedStrings.txt")
        do {
            // Read data from the file and decode it back to an array of SavedString
            let data = try Data(contentsOf: fileURL)
            savedStrings = try JSONDecoder().decode([SavedString].self, from: data)
        } catch {
            print("Error loading data: \(error.localizedDescription)")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        return paths[0]
    }
}

struct StringSaverView_Previews: PreviewProvider {
    static var previews: some View {
        StringSaverView()
    }
}

// Enum to represent app states
enum AppState {
    case input, list
}

// Custom struct for saving and comparing strings
struct SavedString: Identifiable, Comparable, Codable {
    var id = UUID()
    var value: String
    
    static func < (lhs: SavedString, rhs: SavedString) -> Bool {
        return lhs.value < rhs.value
    }
}

struct StringListView: View {
    @State var strings: [SavedString]
    
    var body: some View {
        List(strings) { savedString in
            Text(savedString.value)
        }
    }
}
