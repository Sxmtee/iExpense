//
//  ExpenseList.swift
//  iExpense
//
//  Created by mac on 22/10/2024.
//

import SwiftUI
import SwiftData

struct ExpenseList: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    
    init (type: String = "All", sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate {
            if type == "All" {
                return true
            } else {
                return $0.type == type
            }
        }, sort: sortOrder)
    }

    func removeItem(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
    
    private func color(for amount: Double) -> Color {
           if amount < 10 {
               return .green
           } else if amount < 100 {
               return .orange
           } else {
               return .red
           }
    }
       
   private func weight(for amount: Double) -> Font.Weight {
       if amount < 10 {
           return .regular
       } else if amount < 100 {
           return .medium
       } else {
           return .bold
       }
   }
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: "NGN"))
                        .foregroundStyle(color(for: item.amount))
                        .fontWeight(weight(for: item.amount))
                }
            }
            .onDelete(perform: removeItem)
        }
    }
}
