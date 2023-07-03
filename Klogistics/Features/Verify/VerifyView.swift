//
//  VerifyView.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct VerifyView: View {
    @ObservedObject var model: VerifyModel
    init(r: RootModel) {
        model = VerifyModel(r: r)
    }
    
    var body: some View {
        VStack {
            TitleSubtitle(title: "OTP Verification", subtitle: "Enter the 6 digit numbers sent to your email")
                .padding(.top, relative(76, .h))
                .padding(.bottom, relative(70, .h))
            
            HStack {
                Group {
                    digit(num: .constant(""))
                    Spacer()
                    digit(num: .constant(""))
                    Spacer()
                    digit(num: .constant(""))
                }
                
                Spacer()
                
                Group {
                    digit(num: .constant(""))
                    Spacer()
                    digit(num: .constant(""))
                    Spacer()
                    digit(num: .constant(""))
                }
            }
            .padding([.leading, .trailing], 24)
            
            
            underBlue(descr: "If you didn’t receive code, ", buttonLabel: "Resend", action: {})
                .padding(.bottom, relative(84, .h))
            
            BlueButton(action: {}, text: "Set New Password")
            
            Spacer()
        }
    }
}

struct VerifyView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyView(r: RootModel())
    }
}
