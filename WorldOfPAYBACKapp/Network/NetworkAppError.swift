//
//  NetworkAppError.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import Foundation

enum NetworkAppError: String, Error {
    case unableToComplete = "unable To Complete request"
    case invalidData = "invalid data"
    case noNetwork = "No Network"
}
