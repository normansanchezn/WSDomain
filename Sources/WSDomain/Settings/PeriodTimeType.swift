//
//  PeriodTimeType.swift
//  WSDomain
//
//  Created by Norman on 20/01/26.
//

import Foundation

public enum PeriodTimeType: String, Sendable, Codable, CaseIterable {
    case fortnightly
    case monthly

    public var title: String {
        switch self {
        case .fortnightly: return "Quincena"
        case .monthly: return "Mes"
        }
    }

    public var toggleTitle: String {
        switch self {
        case .monthly: return "Cambiar a quincena"
        case .fortnightly: return "Cambiar a meses"
        }
    }

    public var toggled: PeriodTimeType {
        switch self {
        case .monthly: return .fortnightly
        case .fortnightly: return .monthly
        }
    }
}
