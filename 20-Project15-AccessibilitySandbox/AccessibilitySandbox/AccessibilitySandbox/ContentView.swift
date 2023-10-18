//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Po Hsiang Chao on 2023/10/18.
//

import SwiftUI

struct IdentifyingContentView: View {
    
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
    }
}

struct GroupChildrenContentView: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

struct ReadingValuesContentView: View {
    @State private var value = 10

    var body: some View {
        VStack {
            Text("Value: \(value)")

            Button("Increment") {
                value += 1
            }

            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled")
            }
        }
    }
}

struct ContentView: View {
     
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    IdentifyingContentView()
                } label: {
                    Text("Identifying views with useful labels")
                }
                
                NavigationLink {
                    GroupChildrenContentView()
                } label: {
                    Text("Hiding and grouping accessibility data")
                }
                
                NavigationLink {
                    ReadingValuesContentView()
                } label: {
                    Text("Reading the value of controls")
                }
            }
            .font(.title)
            .navigationTitle("Accessibility example")
        }
    }
}

#Preview {
    ContentView()
}
