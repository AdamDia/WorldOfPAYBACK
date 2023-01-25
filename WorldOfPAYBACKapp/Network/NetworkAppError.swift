//
//  NetworkAppError.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 23/01/2023.
//

import Foundation

enum NetworkAppError: String, Error {
    case unableToComplete = "There is an issue that occurs while connecting to the server. Please try again later, and if this issue persists please contact support."
    case invalidData = "The data received from the server was invalid. Please try again or contact support."
    case noNetwork = "It seems that you have no internet connection, Please check your internet and try Again."
}
