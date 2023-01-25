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
        ZStack {
            List(viewModel.transactions) { transaction in
                TransactionCell(transaction: transaction)
                    .onTapGesture {
                        viewModel.goToTransactionDetailDetails(transaction: transaction)
                    }
            }
            .navigationTitle("Transactions")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        ///open filter screen
                    } label: {
                        FilterButton()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Sum \(viewModel.sumFilteredValues)")
                }
            }
            .onAppear {
                viewModel.fetchDataIfNeeded()
                viewModel.shouldFetchData = false
            }
            
            if viewModel.isLoading {LoadingView()}
        }
    }
}

struct TransactionsList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsList(viewModel: TransactionsViewModel(networkManager: NetworkManager()))
    }
}
