//
//  AppSettings.swift
//  WSDomain
//
//  Created by Norman on 20/01/26.
//

import Foundation

public struct AppSettings: Sendable, Codable, Equatable {
    public var salary: SalarySettings

    public init(salary: SalarySettings) {
        self.salary = salary
    }

    public static let `default` = AppSettings(
        salary: SalarySettings(
            amount: Money(amount: 0, currency: .mxn),
            period: .fortnightly
        )
    )
}
