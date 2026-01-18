//
//  ListExpenses.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public struct ListExpensesUseCase: Sendable {
    private let repository: any ExpensesRepository

    public init(repository: any ExpensesRepository) {
        self.repository = repository
    }

    public func callAsFunction() async throws -> [Expense] {
        try await repository.listAll()
    }
}
