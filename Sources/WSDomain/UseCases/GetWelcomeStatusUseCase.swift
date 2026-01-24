//
//  GetWelcomeStatusUseCase.swift
//  WSDomain
//
//  Created by Norman on 23/01/26.
//

import Foundation

public struct GetWelcomeStatusUseCase: Sendable {
    private let repository: OnboardingRepository

    public init(repository: OnboardingRepository) {
        self.repository = repository
    }

    public func callAsFunction() async -> Bool {
        do {
            return try await repository.hasSeenWelcome()
        } catch {
            // Por seguridad UX: si falla, mostramos welcome en vez de bloquear
            return false
        }
    }
}
