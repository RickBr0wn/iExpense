//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Rick Brown on 11/12/2020.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
  var id = UUID()
  var name: String
  var type: String
  var amount: Int
}
