//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Po Hsiang Chao on 2023/8/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cupcake = Cupcake()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $cupcake.order.type) {
                        ForEach(Cupcake.types.indices) {
                            Text(Cupcake.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(cupcake.order.quantity)", value: $cupcake.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $cupcake.order.specialRequestEnabled.animation())

                    if cupcake.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $cupcake.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $cupcake.order.addSprinkles)
                    }
                }

                Section {
                    NavigationLink {
                        AddressView(cupcake: cupcake)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
