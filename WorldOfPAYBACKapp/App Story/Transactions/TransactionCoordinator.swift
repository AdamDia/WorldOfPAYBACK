//
//  TransactionCoordinator.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import SwiftUI

class TransactionsCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    private let viewModel = TransactionsViewModel(networkManager: NetworkManager())
    
    private lazy var transactionsList: TransactionsList = {
        var vc = TransactionsList(viewModel: viewModel)
        viewModel.transactionsCoordinator = self
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([UIHostingController(rootView: transactionsList)], animated: false)
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationBar.tintColor = UIColor.label
    }
    
    func gotDetailsScreen(transaction: TransactionItem) {
        let detailsVC = TransactionDetails(transaction: transaction)
        detailsVC.title = "Details"
        detailsVC.overrideUserInterfaceStyle = .dark
        rootViewController.pushViewController(detailsVC, animated: true)
    }
}
