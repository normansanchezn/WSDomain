//
//  MarkWelcomeSeenUseCase.swift
//  WSDomain
//
//  Created by Norman on 23/01/26.
//

import Foundation

public struct MarkWelcomeSeenUseCase: Sendable {
    private let repository: OnboardingRepository

    public init(repository: OnboardingRepository) {
        self.repository = repository
    }

    public func callAsFunction() async {
        do {
            try await repository.setHasSeenWelcome(true)
        } catch {
            // no-op (puedes loggear en WSShared si ya tienes logger)
        }
    }
}
