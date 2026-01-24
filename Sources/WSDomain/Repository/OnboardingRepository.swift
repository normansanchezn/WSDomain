//
//  OnboardingRepository.swift
//  WSDomain
//
//  Created by Norman on 23/01/26.
//


import Foundation

public protocol OnboardingRepository: Sendable {
    func hasSeenWelcome() async throws -> Bool
    func setHasSeenWelcome(_ value: Bool) async throws
}
