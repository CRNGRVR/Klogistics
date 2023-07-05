//
//  topBar.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import SwiftUI

struct topBar: View {
    var title: String
    var isButton: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.white
                .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 2)
            
            VStack {
                if isButton {
                    Spacer()
                    HStack {
                        Button(action: {action()}, label: {
                            Image("back")
                        })
                        .padding(.leading, 27)
                        
                        Spacer()
                    }
                    .padding(.bottom, 22)
                }
                    
            }
            
            VStack {
                Spacer()
                
                Text(title)
                    .font(.custom(Roboto.medium.rawValue, size: 16))
                    .foregroundColor(.gray)
                    .padding(.bottom, 22)
            }
        }
        .frame(height: relative(108, .h))
    }
}

struct topBar_Previews: PreviewProvider {
    static var previews: some View {
        topBar(title: "Notification", isButton: true, action: {})
    }
}
