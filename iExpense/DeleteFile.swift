//
//  DeleteFile.swift
//  iExpense
//
//  Created by mac on 17/06/2024.
//

import SwiftUI

struct DeleteFile: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    
    }
}


#Preview {
    DeleteFile()
}
