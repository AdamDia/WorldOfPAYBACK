//
//  ApplicationCoordinator.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import UIKit

protocol Coordinator {
    func start()
}

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    var childCoordinator = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let transactionsCoordinator = TransactionsCoordinator()
        transactionsCoordinator.start()
        childCoordinator = [transactionsCoordinator]
        window.rootViewController = transactionsCoordinator.rootViewController
    }
    
}
