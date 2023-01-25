//
//  LoadingView.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 25/01/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20.0){
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
                Text("Loading Transactions...")
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
