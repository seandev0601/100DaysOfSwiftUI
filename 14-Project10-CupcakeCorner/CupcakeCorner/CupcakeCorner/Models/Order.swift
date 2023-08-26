//
//  Order.swift
//  CupcakeCorner
//
//  Created by Po Hsiang Chao on 2023/8/23.
//

import Foundation

struct Order: Codable {
    
    var type = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        (name.isInvalid || streetAddress.isInvalid || city.isInvalid || zip.isInvalid) ? false : true
    }
    
    var cost: Double {
        //$2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1 / cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50 / cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
