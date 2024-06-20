//
//  ContentView.swift
//  iExpense
//
//  Created by mac on 17/06/2024.
//

import SwiftUI

@Observable
class User {
    var firstName = "Winifred"
    var lastName = "Obi"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("My name is \(user.firstName) \(user.lastName)")
            
            TextField("FirstName", text: $user.firstName)
            TextField("LastName", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
