//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Po Hsiang Chao on 2023/7/29.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
