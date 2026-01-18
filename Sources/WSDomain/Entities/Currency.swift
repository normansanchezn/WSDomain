//
//  Currency.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public enum Currency: String, Sendable, Codable, CaseIterable {
    case mxn
    case usd

    public var code: String { rawValue.uppercased() }
}
