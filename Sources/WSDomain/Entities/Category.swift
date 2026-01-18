//
//  Category.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public struct Category: Sendable, Codable, Equatable, Hashable, Identifiable {
    public let id: UUID
    public var name: String
    public var emoji: String?

    public init(id: UUID = UUID(), name: String, emoji: String? = nil) {
        self.id = id
        self.name = name
        self.emoji = emoji
    }
}
