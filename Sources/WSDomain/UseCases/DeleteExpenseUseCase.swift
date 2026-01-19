//
//  DeleteExpenseUseCase.swift
//  WSDomain
//
//  Created by Norman on 18/01/26.
//

import Foundation

public struct DeleteExpenseUseCase: Sendable {
    private let repository: any ExpensesRepository
    
    public init(repository: any ExpensesRepository) {
        self.repository = repository
    }
    
    public func execute(expenseId: UUID) async throws {
        try await repository.delete(id: expenseId)
    }
}
