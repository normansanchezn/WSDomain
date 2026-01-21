//
//  GetAppSettingsUseCase.swift
//  WSDomain
//
//  Created by Norman on 20/01/26.
//

import Foundation

public struct GetAppSettingsUseCase: Sendable {
    private let repository: any AppSettingsRepository

    public init(repository: any AppSettingsRepository) {
        self.repository = repository
    }

    public func callAsFunction() async throws -> AppSettings {
        try await repository.get()
    }
}
