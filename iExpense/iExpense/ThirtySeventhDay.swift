//
//  ThirtySeventhDay.swift
//  iExpense
//
//  Created by Ваня Науменко on 21.02.24.
//

import SwiftUI

// MARK: - ExpenseItem

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

// MARK: - Expenses

@Observable class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoderItems = try? JSONDecoder().decode([ExpenseItem].self, from: saveItems ) {
                items = decoderItems
                return
            }
        }
        items = []
    }
}

// MARK: - ThirtySeventhDay

struct ThirtySeventhDay: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
        Image("Снимок экрана 2024-02-21 в 20.47.13")
            .resizable()
    }
}

#Preview {
    ThirtySeventhDay()
}
