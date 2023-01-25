//
//  TransactionViewModelTests.swift
//  WorldOfPAYBACKappTests
//
//  Created by Adam Essam on 25/01/2023.
//

import XCTest
@testable import WorldOfPAYBACKapp

final class TransactionViewModelTests: XCTestCase {
    private var mockTransactionViewModel: TransactionsViewModel!
    private var mockableNetworkManager: MockNetwokManager!
    
    override func setUp() {
        super.setUp()
        mockableNetworkManager = MockNetwokManager()
        mockTransactionViewModel = TransactionsViewModel(networkManager: mockableNetworkManager)
    }
    
    override func tearDown() {
        super.tearDown()
        mockableNetworkManager = nil
        mockTransactionViewModel = nil
    }
    
    
    func test_getTransactions() {
        mockTransactionViewModel.getTransactions()
        XCTAssertEqual(mockTransactionViewModel.transactions[0].partnerDisplayName, "Test Name two")
    }
}
