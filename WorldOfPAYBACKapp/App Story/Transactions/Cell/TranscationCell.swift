//
//  TranscationCell.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import SwiftUI

struct TransactionCell: View {
    
    let transaction: TransactionItem
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("\(transaction.transactionDetail.bookingDate.dateStrFormatter())")
                .foregroundColor(Color.gray)
                .font(.callout)
                .fontWeight(.light)
            HStack {
                HStack{
                    VStack(alignment: .leading) {
                        Text(transaction.partnerDisplayName)
                            .fontWeight(.bold)
                        Text(transaction.transactionDetail.transactionDetailDescription ?? "No Description provided")
                            .fontWeight(.light)
                    }
                    Spacer()
                    Text("\(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency)")
                        .fontWeight(.bold)
                }
                .padding()
            }
            .background(Color.blue)
            .cornerRadius(10.0)
            .font(.body)
            .foregroundColor(Color.white)
        }
    }
}
struct TransactionCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCell(transaction: TransactionItem(partnerDisplayName: "TransFirst", alias: Alias(reference: ""), category: 1, transactionDetail: TransactionDetail(transactionDetailDescription: "Check description", bookingDate: "20-20-2002", value: Value(amount: 50, currency: "$"))))
    }
}

