//
//  SwiftDataModel.swift
//  iExpense
//
//  Created by mac on 22/10/2024.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var name: String
    var type: String
    var amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
