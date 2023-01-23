//
//  NetworkManager.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import UIKit

protocol NetworkManagerProtocol {
    typealias getTransactionsResults = Result<[TransactionItem], NetworkAppError>
    typealias getTransactionsCompleted = (_ result: getTransactionsResults) -> Void
    
    func getTransactions(completed: @escaping getTransactionsCompleted)
}

final class NetworkManager: NetworkManagerProtocol, JsonLoader {
    func getTransactions(completed: @escaping getTransactionsCompleted) {
        loadJSON(filename: "PBTransactions", type: TransactionsDataModel.self) { result in
            switch result {
            case .success(let data):
                completed(.success(data.items))
            case .failure(_):
                completed(.failure(.invalidData))
            }
        }
    }
}
