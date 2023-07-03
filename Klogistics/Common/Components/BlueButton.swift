//
//  BlueButton.swift
//  Klogistics
//
//  Created by Иван on 02.07.2023.
//

import SwiftUI

struct BlueButton: View {
    var action: () -> ()
    var text: String
    
    var body: some View {
        Button(action: {action()} , label: {
            ZStack {
                Color("Blue")
                    .cornerRadius(4)
                
                Text(text)
                    .font(.custom(Roboto.bold.rawValue, size: 16))
                    .foregroundColor(.white)
            }
            .frame(height: 46)
            .padding([.leading, .trailing], 24)
        })
    }
}
