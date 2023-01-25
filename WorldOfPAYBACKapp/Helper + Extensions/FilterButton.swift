//
//  FilterButton.swift
//  WorldOfPAYBACKapp
//
//  Created by Adam Essam on 25/01/2023.
//

import SwiftUI

struct FilterButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.clear)
                .opacity(0.6)
            
            HStack{
                Image("filterIcon")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton()
    }
}
