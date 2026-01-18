//
//  AddExpense.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public struct AddExpenseUseCase: Sendable {
    private let repository: any ExpensesRepository

    public init(repository: any ExpensesRepository) {
        self.repository = repository
    }

    public func callAsFunction(_ expense: Expense) async throws {
        try await repository.add(expense)
    }
}
