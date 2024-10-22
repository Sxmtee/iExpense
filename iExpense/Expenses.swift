//
//  Expenses.swift
//  iExpense
//
//  Created by mac on 19/06/2024.
//

import SwiftUI
import SwiftData

struct ScaffoldView: View {
    @State private var showingAddExpense = false
    @State private var expenseType = "All"
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount, order: .reverse),
    ]
    

    var body: some View {
        NavigationStack {
            ExpenseList(type: expenseType, sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter", selection: $expenseType) {
                            Text("Show All Expenses")
                                .tag("All")

                            Divider()

                            ForEach(AddView.types, id: \.self) { type in
                                Text(type)
                                    .tag(type)
                            }
                        }
                    }
                        
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name (A-Z)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            
                            Text("Name (Z-A)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name, order: .reverse),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            
                            Text("Price (Cheapest First)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])

                            Text("Price (Expensive First")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                    
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView()
                }
        }
    }
}


#Preview {
    ScaffoldView()
}
