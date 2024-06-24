//
//  Expenses.swift
//  iExpense
//
//  Created by mac on 19/06/2024.
//

import SwiftUI

struct ExpenseItems: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expense {
    var items = [ExpenseItems]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode(
                [ExpenseItems].self,
                from: savedItems
            ) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ScaffoldView: View {
    @State private var expenses = Expense()
    @State private var showingAddExpense = false
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
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
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
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
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
}


#Preview {
    ScaffoldView()
}
