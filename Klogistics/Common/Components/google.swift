//
//  google.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct google: View {
    var action: () -> ()
    
    var body: some View {
        VStack {
            Text("or sign in using")
                .font(.custom(Roboto.regular.rawValue, size: 14))
                .foregroundColor(.gray)
            
            Button(action: {action()}, label: {
                Image("G")
            })
        }
    }
}
