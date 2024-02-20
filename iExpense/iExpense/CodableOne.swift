//
//  CodableOne.swift
//  iExpense
//
//  Created by Ваня Науменко on 20.02.24.
//

import SwiftUI

struct User: Codable {
    let fistName: String
    let lastName: String
}

struct CodableOne: View {
    @State private var user = User(fistName: "Ivan", lastName: "Naumenko")
    var body: some View {
        Button("Save User "){
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    CodableOne()
}
