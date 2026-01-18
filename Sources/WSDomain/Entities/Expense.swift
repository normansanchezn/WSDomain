//
//  Expense.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public struct Expense: Sendable, Codable, Equatable, Hashable, Identifiable {
    public let id: UUID
    public var date: Date
    public var amount: Money
    public var category: Category
    public var note: String?

    public init(
        id: UUID = UUID(),
        date: Date,
        amount: Money,
        category: Category,
        note: String? = nil
    ) {
        self.id = id
        self.date = date
        self.amount = amount
        self.category = category
        self.note = note
    }
}
