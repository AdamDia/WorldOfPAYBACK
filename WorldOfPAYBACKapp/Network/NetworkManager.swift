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
        let probability = 0.1
        let randomValue = arc4random_uniform(100)
        
        if Reachability.isConnectedToNetwork() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [weak self] in
                
                if Double(randomValue) / 100 < probability {
                    completed(.failure(.unableToComplete))
                } else {
                    self?.loadJSON(filename: "PBTransactions", type: TransactionsDataModel.self) { result in
                        switch result {
                        case .success(let data):
                            completed(.success(data.items))
                        case .failure(_):
                            completed(.failure(.invalidData))
                        }
                    }
                }
            }
        } else {
            completed(.failure(.noNetwork))
        }
    }
}
