//
//  Cupcake.swift
//  CupcakeCorner
//
//  Created by Po Hsiang Chao on 2023/8/25.
//

import Foundation

class Cupcake: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var order: Order
    
    init() {
        order = Order()
    }
}

