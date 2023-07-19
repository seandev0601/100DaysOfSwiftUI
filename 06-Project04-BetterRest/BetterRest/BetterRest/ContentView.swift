//
//  ContentView.swift
//  BetterRest
//
//  Created by Po Hsiang Chao on 2023/7/18.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var bedTime: String {
        calculateBedtime()
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily coffee intake") {
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                                Text($0 == 1 ? "1 cup" : "\($0) cups")
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section {
                    Text(bedTime)
                        .font(.largeTitle)
                } header: {
                    Text("Recommended Bedtime")
                        .font(.headline)
                }
                
            }
            .navigationTitle("BetterRest")
            
        }
    }
    
    func calculateBedtime() -> String {
        do {
            // Creating an Instance of the Core ML Model
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
        
            // Extracting Hour and Minute Components from Date
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            // Making a Prediction using the Core ML Model
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount + 1))

            // Calculating Bedtime and Displaying in Alert
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            // Handle error
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
