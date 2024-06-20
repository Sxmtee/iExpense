//
//  Codeable.swift
//  iExpense
//
//  Created by mac on 19/06/2024.
//

import SwiftUI

struct Users: Codable {
    let firstName: String
    let lastName: String
}


struct ArchiveAble: View {
    @State private var users = Users(
        firstName: "Taylor",
        lastName: "Swift"
    )
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(users) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}


#Preview {
    ArchiveAble()
}
