//
//  SaveAppSettingsUseCase.swift
//  WSDomain
//
//  Created by Norman on 20/01/26.
//

import Foundation

public struct SaveAppSettingsUseCase: Sendable {
    private let repository: any AppSettingsRepository

    public init(repository: any AppSettingsRepository) {
        self.repository = repository
    }

    public func callAsFunction(_ settings: AppSettings) async throws {
        try await repository.save(settings)
    }
}
