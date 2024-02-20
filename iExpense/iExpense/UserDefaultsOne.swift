//
//  UserDefaults.swift
//  iExpense
//
//  Created by Ваня Науменко on 20.02.24.
//

import SwiftUI

struct UserDefaultsOne: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    UserDefaultsOne()
}
