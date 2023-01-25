//
//  TransactionDetails.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 25/01/2023.
//

import UIKit

class TransactionDetails: UIViewController {

    @IBOutlet weak var transactionNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let transaction: TransactionItem
    
    init(transaction: TransactionItem) {
        self.transaction = transaction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    private func prepareUI() {
        transactionNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        
        transactionNameLabel.text = transaction.partnerDisplayName
        descriptionLabel.text = transaction.transactionDetail.transactionDetailDescription ?? ""
    }
}
