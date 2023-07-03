//
//  ForgotPasswordView.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var model: ForgotPasswordModel
    init(r: RootModel) {
        model = ForgotPasswordModel(r: r)
    }
    
    var body: some View {
        VStack {
            TitleSubtitle(title: "Forgot Password", subtitle: "Enter your email address")
                .padding(.top, relative(110, .h))
                .padding(.bottom, relative(48, .h))
            
            tf(text: .constant(""), descr: "Email Address", placeholder: "***********@mail.com")
                .padding(.bottom, relative(64, .h))
            
            BlueButton(action: {}, text: "Send OTP")
            
            underBlue(descr: "Remember password? Back to ", buttonLabel: "Sign in", action: {})
            
            Spacer()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(r: RootModel())
    }
}
