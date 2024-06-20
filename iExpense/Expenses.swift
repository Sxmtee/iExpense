//
//  Expenses.swift
//  iExpense
//
//  Created by mac on 19/06/2024.
//

import SwiftUI

struct ExpenseItems: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expense {
    var items = [ExpenseItems]()
}

struct ScaffoldView: View {
    @State private var expenses = Expense()
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    let testItem = ExpenseItems(
                        name: "Test",
                        type: "Personal",
                        amount: 5
                    )
                    
                    expenses.items.append(testItem)
                }
            }
        }
    }
}


#Preview {
    ScaffoldView()
}
