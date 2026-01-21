//
//  TogglePeriodTypeUseCase.swift
//  WSDomain
//
//  Created by Norman on 20/01/26.
//

import Foundation

public struct TogglePeriodTypeUseCase: Sendable {
    private let repository: any AppSettingsRepository

    public init(repository: any AppSettingsRepository) {
        self.repository = repository
    }

    public func callAsFunction() async throws -> AppSettings {
        var settings = try await repository.get()
        settings.salary.period = settings.salary.period.toggled
        try await repository.save(settings)
        return settings
    }
}
