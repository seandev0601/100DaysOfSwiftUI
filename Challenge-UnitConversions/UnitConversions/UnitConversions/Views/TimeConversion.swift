//
//  TimeConversion.swift
//  UnitConversions
//
//  Created by Po Hsiang Chao on 2023/7/11.
//

import SwiftUI

struct TimeConversion: View {
    
    @State private var inputNumber: Int?
    @State private var inputUnit: UnitTime = .seconds
    @State private var outputUnit: UnitTime = .minutes
    @FocusState private var timeIsFocused: Bool
    
    var result: Double? {
        guard let inputNumber = inputNumber else { return nil }
        
        let number = Double(inputNumber)
        let seconds = inputUnit.convertToSeconds(of: number)
        let result = outputUnit.converted(of: seconds)
        
        return result
    }
    
    var body: some View {
        Form {
            
            Section {
                Text("Input unit")
                    .bold()
                Picker("Unit", selection: $inputUnit) {
                    ForEach(UnitTime.allCases) {
                        Text($0.rawValue).tag($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section {
                Text("Output unit")
                    .bold()
                Picker("Unit", selection: $outputUnit) {
                    ForEach(UnitTime.allCases) {
                        Text($0.rawValue).tag($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section {
                TextField("Enter a number", value: $inputNumber, format: .number)
                    .keyboardType(.numberPad)
                    .focused($timeIsFocused)
            } header: {
                Text("Input your time(\(inputUnit.symbol)).")
            }
            
            if let result = result {
                Section {
                    Text("\(result, specifier: "%.2f") \(outputUnit.symbol)")
                } header: {
                    Text("Conversion result")
                }
            }
        }
        .navigationTitle("Time Conversion")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    timeIsFocused = false
                }
            }
        }
    }
}

struct TimeConversion_Previews: PreviewProvider {
    static var previews: some View {
        TimeConversion()
    }
}
