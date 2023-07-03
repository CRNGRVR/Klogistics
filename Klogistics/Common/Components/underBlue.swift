//
//  underBlue.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct underBlue: View {
    var descr: String
    var buttonLabel: String
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 2) {
            Text(descr)
                .font(.custom(Roboto.regular.rawValue, size: 14))
                .foregroundColor(.gray)
            
            Button(action: {action()}, label: {
                Text(buttonLabel)
                    .font(.custom(Roboto.medium.rawValue, size: 14))
                    .foregroundColor(Color("Blue"))
            })
        }
    }
}
