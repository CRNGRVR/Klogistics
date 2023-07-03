//
//  digit.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct digit: View {
    @Binding var num: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color("Warning"), lineWidth: 1)
            
            TextField("", text: $num)
                .font(.custom(Roboto.medium.rawValue, size: 12))
                .padding(.leading, 12)
        }
        .frame(width: 32, height: 32)
    }
}
