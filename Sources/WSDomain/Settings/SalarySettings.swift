//
//  SalarySettings.swift
//  WSDomain
//
//  Created by Norman on 20/01/26.
//

import Foundation

public struct SalarySettings: Sendable, Codable, Equatable {
    public var amount: Money
    public var period: PeriodTimeType

    public init(amount: Money, period: PeriodTimeType) {
        self.amount = amount
        self.period = period
    }
}
