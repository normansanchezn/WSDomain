//
//  Money.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public struct Money: Sendable, Codable, Equatable, Hashable {
    public var amount: Decimal
    public var currency: Currency

    public init(amount: Decimal, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }

    public static func +(lhs: Money, rhs: Money) -> Money {
        precondition(lhs.currency == rhs.currency, "Currency mismatch")
        return Money(amount: lhs.amount + rhs.amount, currency: lhs.currency)
    }
}
