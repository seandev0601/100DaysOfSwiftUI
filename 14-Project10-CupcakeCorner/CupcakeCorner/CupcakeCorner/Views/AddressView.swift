//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Po Hsiang Chao on 2023/8/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var cupcake: Cupcake
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $cupcake.order.name)
                TextField("Street Address", text: $cupcake.order.streetAddress)
                TextField("City", text: $cupcake.order.city)
                TextField("Zip", text: $cupcake.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(cupcake: cupcake)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(cupcake.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(cupcake: Cupcake())
        }
    }
}
