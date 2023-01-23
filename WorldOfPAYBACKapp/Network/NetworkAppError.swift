//
//  NetworkAppError.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import Foundation

enum NetworkAppError: String, Error {
    case invalidURL = "invalid URL"
    case unableToComplete = "unable To Complete request"
    case invalidResponse = "invalid response"
    case invalidData = "invalid data"
}
