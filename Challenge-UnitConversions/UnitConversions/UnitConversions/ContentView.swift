//
//  ContentView.swift
//  UnitConversions
//
//  Created by Po Hsiang Chao on 2023/7/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    TimeConversion()
                } label: {
                    Text("Time")
                }
            }
            .navigationTitle("Unit Conversions")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
