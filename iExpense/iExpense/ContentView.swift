//
//  ContentView.swift
//  iExpense
//
//  Created by Ваня Науменко on 20.02.24.
//

import SwiftUI
import Observation
import UserNotificationsUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

//@Observable class User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

struct ContentView: View {
    @State private var showingSheet = false
    @State private var myName = ""
//    @State private var user = User()
    var body: some View {
        TextField("Name", text: $myName)
            .padding()
            .textFieldStyle(.roundedBorder)
    
        Button("Shoe Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "\(myName)")
        }
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//                .font(.title)
//                .foregroundStyle(.white)
//            Section {
//                TextField("First naem", text: $user.firstName)
//                TextField("Last name", text: $user.lastName)
//            }
//            .padding()
//            .bold()
//            .textFieldStyle(.roundedBorder)
//            
//          
//            
//        }
//        .padding()
//        .background(.gray)
    }
    
}

#Preview {
    ContentView()
}
