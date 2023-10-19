//
//  ExpenseView.swift
//  iExpense
//
//  Created by Po Hsiang Chao on 2023/7/30.
//

import SwiftUI

struct ExpenseView: View {
    var expense: ExpenseItem
    
    init(_ expense: ExpenseItem) {
        self.expense = expense
    }
    
    var color: Color {
        if expense.amount < 10 {
            return .black
        } else if expense.amount < 100 {
            return .orange
        } else {
            return .red
        }
    }

    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.headline)
                Text(expense.type)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundColor(color)
        }
        .padding(2)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(expense.name) cost \(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
        .accessibilityHint(expense.type)
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ExpenseView(ExpenseItem(name: "Game", type: "Personal", amount: 5))
            ExpenseView(ExpenseItem(name: "Launch", type: "Personal", amount: 50))
            ExpenseView(ExpenseItem(name: "Taxi", type: "Personal", amount: 105))
        }
    }
}
