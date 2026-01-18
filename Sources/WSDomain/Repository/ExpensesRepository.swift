//
//  ExpensesRepository.swift
//  WSDomain
//
//  Created by Norman on 17/01/26.
//

import Foundation

public protocol ExpensesRepository: Sendable {
    func add(_ expense: Expense) async throws
    func listAll() async throws -> [Expense]
    func delete(id: Expense.ID) async throws
}
