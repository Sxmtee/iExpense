//
//  SavePreference.swift
//  iExpense
//
//  Created by mac on 17/06/2024.
//

import SwiftUI

struct SavePreference: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    SavePreference()
}
