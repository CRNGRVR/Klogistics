//
//  TitleSubtitle.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct TitleSubtitle: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(Roboto.medium.rawValue, size: 24))
                    .padding(.leading, 24)
                
                Spacer()
            }
            .padding(.bottom, 8)
            
            HStack {
                Text(subtitle)
                    .font(.custom(Roboto.medium.rawValue, size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading, 24)
                
                Spacer()
            }
        }
    }
}
