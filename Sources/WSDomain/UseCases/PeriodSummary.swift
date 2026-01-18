//
//  PeriodSummary.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public struct PeriodSummary: Sendable, Equatable, Hashable {
    public let period: Period
    public let total: Money
}

public struct SummarizeByPeriod: Sendable {
    private let repository: any ExpensesRepository

    public init(repository: any ExpensesRepository) {
        self.repository = repository
    }

    public func callAsFunction(calendar: Calendar = .current) async throws -> [PeriodSummary] {
        let items = try await repository.listAll()
        guard let currency = items.first?.amount.currency else { return [] }

        var totals: [Period: Decimal] = [:]
        for e in items {
            let comps = calendar.dateComponents([.year, .month, .day], from: e.date)
            guard let year = comps.year, let month = comps.month, let day = comps.day else { continue }
            let half = (day <= 15) ? 1 : 2
            let p = Period(kind: .fortnight(year: year, month: month, half: half))
            totals[p, default: 0] += e.amount.amount
        }

        return totals
            .map { PeriodSummary(period: $0.key, total: Money(amount: $0.value, currency: currency)) }
            .sorted { $0.period.id > $1.period.id }
    }
}
