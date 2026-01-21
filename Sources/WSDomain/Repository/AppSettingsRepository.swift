//
//  AppSettingsRepository.swift
//  WSDomain
//
//  Created by Norman on 20/01/26.
//

import Foundation

public protocol AppSettingsRepository: Sendable {
    func get() async throws -> AppSettings
    func save(_ settings: AppSettings) async throws
}
