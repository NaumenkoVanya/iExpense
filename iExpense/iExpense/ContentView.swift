//
//  ContentView.swift
//  iExpense
//
//  Created by Ваня Науменко on 20.02.24.
//

import SwiftUI
import Observation

@Observable class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}
struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
                .font(.title)
                .foregroundStyle(.white)
            Section {
                TextField("First naem", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
            .padding()
            .bold()
            .textFieldStyle(.roundedBorder)
            
          
            
        }
        .padding()
        .background(.gray)
    }
    
}

#Preview {
    ContentView()
}
