//
//  PeriodKind.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public enum PeriodKind: Sendable, Codable, Equatable, Hashable {
    case month(year: Int, month: Int)
    case fortnight(year: Int, month: Int, half: Int)
}

public struct Period: Sendable, Codable, Equatable, Hashable, Identifiable {
    public let id: String
    public let kind: PeriodKind

    public init(kind: PeriodKind) {
        self.kind = kind
        self.id = Period.makeId(kind: kind)
    }

    public func dateInterval(calendar: Calendar = .current) -> DateInterval? {
        switch kind {
        case let .month(year, month):
            var comps = DateComponents()
            comps.year = year
            comps.month = month
            comps.day = 1
            guard let start = calendar.date(from: comps),
                  let range = calendar.range(of: .day, in: .month, for: start),
                  let end = calendar.date(byAdding: .day, value: range.count, to: start)
            else { return nil }
            return DateInterval(start: start, end: end)

        case let .fortnight(year, month, half):
            var comps = DateComponents()
            comps.year = year
            comps.month = month
            comps.day = (half == 1) ? 1 : 16
            guard let start = calendar.date(from: comps) else { return nil }

            if half == 1 {
                guard let end = calendar.date(byAdding: .day, value: 15, to: start) else { return nil }
                return DateInterval(start: start, end: end)
            } else {
                var next = DateComponents()
                next.year = year
                next.month = month
                next.day = 1
                guard let firstOfMonth = calendar.date(from: next),
                      let end = calendar.date(byAdding: .month, value: 1, to: firstOfMonth)
                else { return nil }
                return DateInterval(start: start, end: end)
            }
        }
    }

    private static func makeId(kind: PeriodKind) -> String {
        switch kind {
        case let .month(year, month):
            return "m-\(year)-\(month)"
        case let .fortnight(year, month, half):
            return "q-\(year)-\(month)-\(half)"
        }
    }
}
