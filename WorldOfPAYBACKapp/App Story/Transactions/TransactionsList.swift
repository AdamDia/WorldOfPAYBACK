//
//  TransactionsList.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import SwiftUI

struct TransactionsList: View {
    
    @ObservedObject var viewModel: TransactionsViewModel
    @State private var isSheetPresented = false
    @State private var currentSelectedFilter: String? = nil
    
    var body: some View {
        ZStack {
            List(viewModel.filteredTransactions) { transaction in
                TransactionCell(transaction: transaction)
                    .onTapGesture {
                        viewModel.goToTransactionDetailDetails(transaction: transaction)
                    }
            }
            .navigationTitle("Transactions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isSheetPresented = true
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
            .sheet(isPresented: $isSheetPresented) {
                FilterCategoryView(viewModel: viewModel, isSheetPresented: $isSheetPresented, currentSelectedFilter: $currentSelectedFilter)
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
