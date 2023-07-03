//
//  LogInView.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct LogInView: View {
    @ObservedObject var model: LogInModel
    init(r: RootModel) {
        model = LogInModel(r: r)
    }
    
    var body: some View {
        VStack {
            TitleSubtitle(title: "Welcome Back", subtitle: "Fill in your email and password to continue")
                .padding(.top, relative(110, .h))
                .padding(.bottom, relative(48, .h))
            
            tf(text: .constant(""), descr: "Email Address", placeholder: "***********@mail.com")
                .padding(.bottom, relative(24, .h))
            
            PasswordField(text: .constant(""), descr: "Password", placeholder: "**********")
            
            HStack {
                Checkbox(isChecked: .constant(false))
                    .padding(.leading, 24)
                
                Text("Remember password")
                    .font(.custom(Roboto.medium.rawValue, size: 12))
                    .foregroundColor(.gray)
                    
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Forgot Password?")
                        .font(.custom(Roboto.medium.rawValue, size: 12))
                })
                .padding(.trailing, 24)
            }
//            .padding(.bottom, relative(169, .h))
            
            Spacer()
                .frame(maxHeight: 169)
            
            BlueButton(action: {}, text: "Log in")
            
            underBlue(descr: "Already have an account?", buttonLabel: "Sign Up", action: {})
                .padding(.bottom, relative(30, .h))
            
            google(action: {})
                .padding(.bottom, 10)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(r: RootModel())
    }
}
