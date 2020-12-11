//
//  ContentView.swift
//  iExpense
//
//  Created by Rick Brown on 11/12/2020.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var expenses = Expenses()
  @State private var showAddExpense = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(expenses.items) { item in
          HStack {
            VStack(alignment: .leading) {
              Text(item.name)
                .font(.headline)
              
              Text(item.type)
                .font(.subheadline)
            }
            
            Spacer()
            
            Text("$\(item.amount)")
          }
        }
        .onDelete(perform: { indexSet in
          removeItems(at: indexSet)
        })
      }
      .navigationBarTitle("Expense")
      .navigationBarItems(trailing:
                            Button(action: {
                              self.showAddExpense = true
                            }) {
                              Image(systemName: "plus")
                            }
      )
    }
    .sheet(isPresented: $showAddExpense, content: {
      AddView(expenses: self.expenses)
    })
  }
  
  func removeItems(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
