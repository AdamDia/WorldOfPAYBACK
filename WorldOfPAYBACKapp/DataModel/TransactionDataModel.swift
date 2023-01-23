//
//  TransactionDataModel.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import Foundation

// MARK: - TransactionsData
struct TransactionsDataModel: Codable {
    let items: [TransactionItem]
}

// MARK: - Item
struct TransactionItem: Codable, Identifiable {
    let id = UUID()
    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail
    
    enum CodingKeys: CodingKey {
        case partnerDisplayName
        case alias
        case category
        case transactionDetail
    }
}


// MARK: - Alias
struct Alias: Codable {
    let reference: String
}

// MARK: - TransactionDetail
struct TransactionDetail: Codable {
    let transactionDetailDescription: String?
    let bookingDate: String
    let value: Value

    enum CodingKeys: String, CodingKey {
        case transactionDetailDescription = "description"
        case bookingDate, value
    }
}

// MARK: - Value
struct Value: Codable {
    let amount: Int
    let currency: String
}
