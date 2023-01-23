//
//  String+Ext.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 24/01/2023.
//

import Foundation

extension String {
    func dateStrFormatter() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from: self) ?? Date()
            dateFormatter.dateFormat = "d MMM, YYYY"
            return  dateFormatter.string(from: date)

        }
}
