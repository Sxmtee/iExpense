//
//  showSheet.swift
//  iExpense
//
//  Created by mac on 17/06/2024.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello \(name)")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ShowSheet: View {
    @State private var isShowing = false
    
    var body: some View {
        Button("Show The View") {
            isShowing.toggle()
        }
        .sheet(isPresented: $isShowing) {
            SecondView(name: "Somtee")
        }
    }
}

#Preview {
    ShowSheet()
}
