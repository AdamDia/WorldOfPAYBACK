//
//  MockNetwork.swift
//  WorldOfPAYBACKappTests
//
//  Created by Adam Essam on 25/01/2023.
//

import UIKit
@testable import WorldOfPAYBACKapp

final class MockNetwokManager: NetworkManagerProtocol, JsonLoader {
    func getTransactions(completed: @escaping getTransactionsCompleted) {
        loadJSON(filename: "TransactionsMock", type: TransactionsDataModel.self) { result in
            switch result {
            case .success(let success):
                completed(.success(success.items))
            case .failure:
                completed(.failure(.invalidData))
            }
        }
    }
}

