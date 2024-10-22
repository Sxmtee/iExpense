//
//  iExpenseApp.swift
//  iExpense
//
//  Created by mac on 17/06/2024.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ScaffoldView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
