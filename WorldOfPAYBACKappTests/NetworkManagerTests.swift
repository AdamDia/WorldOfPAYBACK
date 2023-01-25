//
//  NetworkManagerTests.swift
//  WorldOfPAYBACKappTests
//
//  Created by Adam Essam on 25/01/2023.
//

import XCTest
@testable import WorldOfPAYBACKapp

final class NetworkManagerTests: XCTestCase {
    private var mockableNetworkManager: MockNetwokManager!
    
    override func setUp() {
        super.setUp()
        mockableNetworkManager = MockNetwokManager()
    }
    
    override func tearDown() {
        super.tearDown()
        mockableNetworkManager = nil
    }
    
    
    func test_getTransactions() {
        mockableNetworkManager.getTransactions { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data.count, 3)
            case .failure(let error):
                XCTAssertEqual(error, .invalidData)
            }
        }
    }
}
