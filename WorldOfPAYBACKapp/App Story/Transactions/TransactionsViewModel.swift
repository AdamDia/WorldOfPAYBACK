//
//  TransactionsViewModel.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import Foundation

final class TransactionsViewModel: ObservableObject {
    
    var transactions: [TransactionItem] = []
    private var networkManager: NetworkManagerProtocol
    weak var transactionsCoordinator: TransactionsCoordinator?
    
    @Published var isLoading = false
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    
    func getTransactions() {
        isLoading = true
        networkManager.getTransactions{ [weak self] result in
            guard let self = self else { return }
                self.isLoading = false
                switch result {
                case .success(let transactions):
                    self.transactions = transactions.sorted(by: {$0.transactionDetail.bookingDate.compare($1.transactionDetail.bookingDate) == .orderedDescending})
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
}

