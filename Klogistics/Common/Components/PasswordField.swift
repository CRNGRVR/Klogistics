//
//  PasswordField.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct PasswordField: View {
    @Binding var text: String
    var descr: String
    var placeholder: String
    
    @State var showPass: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text(descr)
                    .font(.custom(Roboto.medium.rawValue, size: 14))
                    .foregroundColor(.gray)
                
                Spacer()
            }
                
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 1)
                
                HStack {
                    if showPass {
                        TextField(placeholder, text: $text)
                            .font(.custom(Roboto.medium.rawValue, size: 14))
                            .padding(.leading, 10)
                    } else {
                        SecureField(placeholder, text: $text)
                            .font(.custom(Roboto.medium.rawValue, size: 14))
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    
                    Button(action: {showPass.toggle()}, label: {
                        Image("eye")
                    })
                    .padding(.trailing, 23)
                }
            }
            .frame(height: 44)
        }
        .padding([.leading, .trailing], 24)
    }
}
