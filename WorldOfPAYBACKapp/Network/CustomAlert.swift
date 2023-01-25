//
//  CustomAlert.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 25/01/2023.
//

import SwiftUI

struct AlertItemExt: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var actionButton: Alert.Button?
    var dismissButton: Alert.Button?
}


extension AlertItemExt {
    static func customAlert(type: NetworkAppError, action: (() -> Void)? = nil) -> AlertItemExt {
        switch type {
        case .unableToComplete:
            return AlertItemExt(title: Text("Server Error"), message: Text(type.rawValue), actionButton: .default(Text("Try Again"), action: action), dismissButton: .cancel())
        case .invalidData:
            return AlertItemExt(title: Text("Failed"), message: Text(type.rawValue), actionButton: .default(Text("ok"), action: action), dismissButton: .cancel())
        case .noNetwork:
            return AlertItemExt(title: Text("Internet Connection"), message: Text(type.rawValue), actionButton: .default(Text("Reload"), action: action), dismissButton: .cancel())
        }
    }
}
