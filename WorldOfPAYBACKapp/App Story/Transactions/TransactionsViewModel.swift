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
    
    var shouldFetchData = true
    var sumFilteredValues = 0
    
    @Published var isLoading = false
    @Published var filterType: FilterType = .none
    @Published var alertItem: AlertItemExt?
    @Published var reload: Bool = false
    
    var filteredTransactions: [TransactionItem] {
        switch filterType {
        case .none:
            let array = transactions
            sumFilteredValues = array.map{$0.transactionDetail.value.amount}.reduce(0, +)
            return array
        case .categoryOne:
            let array =  transactions.filter{$0.category == 1}
            sumFilteredValues = array.map{$0.transactionDetail.value.amount}.reduce(0, +)
            return array
        case .categoryTwo:
            let array = transactions.filter{$0.category == 2}
            sumFilteredValues = array.map{$0.transactionDetail.value.amount}.reduce(0, +)
            return array
        }
    }
    
    func updateFilter(to category: FilterType) {
        filterType = category
    }
    
    
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
                switch error {
                case .unableToComplete:
                    self.alertItem = AlertItemExt.customAlert(type: .unableToComplete, action: {
                        self.reload = true
                    })
                case .invalidData:
                    self.alertItem = AlertItemExt.customAlert(type: .invalidData)
                case .noNetwork:
                    self.alertItem = AlertItemExt.customAlert(type: .unableToComplete, action: {
                        self.reload = true
                    })
                }
            }
        }
    }
    
    func goToTransactionDetailDetails(transaction: TransactionItem) {
        transactionsCoordinator?.gotDetailsScreen(transaction: transaction)
    }
    
    func fetchDataIfNeeded(){
        if self.shouldFetchData == true{
            self.getTransactions()
        }
    }
}

