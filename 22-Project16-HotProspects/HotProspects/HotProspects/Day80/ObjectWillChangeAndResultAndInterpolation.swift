//
//  ObjectWillChangeAndResultAndInterpolation.swift
//  HotProspects
//
//  Created by Po Hsiang Chao on 2023/11/1.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ObjectWillChangeAndResultAndInterpolation: View {
    @StateObject private var updater = DelayedUpdater()
    @State private var output = ""
    
    var body: some View {
        Text("Value is \(updater.value)")
        
        if updater.value == 10 {
            Text(output)
                .padding()
                .task {
                    await fetchReadings()
                }
        }
        
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings."
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Download error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ObjectWillChangeAndResultAndInterpolation()
}
