//
//  ContentView.swift
//  iExpense
//
//  Created by Po Hsiang Chao on 2023/7/29.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.personalItems) { item in
                        ExpenseView(item)
                    }
                    .onDelete(perform: removePersonalItems)
                }
                
                Section("Business") {
                    ForEach(expenses.businessItems) { item in
                        ExpenseView(item)
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                Button {
                    showAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        let item = expenses.personalItems[offsets.first!]
        removeItems(of: item)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        let item = expenses.businessItems[offsets.first!]
        removeItems(of: item)
    }
    
    func removeItems(of item: ExpenseItem) {
        if let index = expenses.items.firstIndex(where: { $0.id == item.id }) {
            expenses.items.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
