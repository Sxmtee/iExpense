//
//  AddView.swift
//  iExpense
//
//  Created by mac on 20/06/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount  = 0.0
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField(
                    "Amount",
                    value: $amount,
                    format: .currency(code: "NGN")
                )
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New View")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    modelContext.insert(item)
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
}
