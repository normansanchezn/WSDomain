//
//  CategorySummary.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public struct CategorySummary: Sendable, Equatable, Hashable {
    public let category: Category
    public let total: Money
}

public struct SummarizeByCategory: Sendable {
    private let repository: any ExpensesRepository

    public init(repository: any ExpensesRepository) {
        self.repository = repository
    }

    public func callAsFunction() async throws -> [CategorySummary] {
        let items = try await repository.listAll()
        guard let currency = items.first?.amount.currency else { return [] }

        var totals: [Category: Decimal] = [:]
        for e in items {
            totals[e.category, default: 0] += e.amount.amount
        }

        return totals
            .map { CategorySummary(category: $0.key, total: Money(amount: $0.value, currency: currency)) }
            .sorted { $0.total.amount > $1.total.amount }
    }
}
