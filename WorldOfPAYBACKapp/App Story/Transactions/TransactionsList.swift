//
//  TransactionsList.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import SwiftUI

struct TransactionsList: View {
    
    @ObservedObject var viewModel: TransactionsViewModel
    
    var body: some View {
        List(viewModel.transactions) { transaction in
            TransactionCell(transaction: transaction)
        }
        .navigationTitle("Transactions")
        .onAppear {
            viewModel.getTransactions()
        }
    }
}

struct TransactionsList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsList(viewModel: TransactionsViewModel(networkManager: NetworkManager()))
    }
}
