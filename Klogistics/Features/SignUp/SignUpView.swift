//
//  SignUpView.swift
//  Klogistics
//
//  Created by Иван on 02.07.2023.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var model: SignUpModel
    init(r: RootModel) {
        self.model = SignUpModel(r: r)
    }
    
    var body: some View {
        VStack {
           
            Group {
                HStack {
                    Text(NSLocalizedString("title", comment: ""))
                        .font(.custom(Roboto.medium.rawValue, size: 24))
                        .padding(.leading, 24)
                    
                    Spacer()
                }
                .padding(.bottom, 8)
                
                HStack {
                    Text("Complete the sign up process to get started")
                        .font(.custom(Roboto.medium.rawValue, size: 14))
                        .foregroundColor(.gray)
                        .padding(.leading, 24)
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(maxHeight: 30)
            }
                
                
                
            Group {
                tf(text: $model.name, descr: "Full Name", placeholder: "Abecd   fsgh")
                    
                    Spacer()
                        .frame(maxHeight: 24)
                    
                tf(text: $model.phone, descr: "Phone Number", placeholder: "000000000000")
                    
                    Spacer()
                        .frame(maxHeight: 24)
                    
                tf(text: $model.mail, descr: "Email Address", placeholder: "***********@mail.com")

                    Spacer()
                        .frame(maxHeight: 24)

                PasswordField(text: $model.password, descr: "Password", placeholder: "**********")
            }
                
                
            
            
            
            
            HStack {
                VStack {
                    Checkbox(isChecked: $model.isAgree)
                    Spacer()
                }
                
                Spacer()
                
                Text("By ticking this box, you agree to our \(Text("Terms and conditions and private policy").foregroundColor(Color("Warning")))")
                    .font(.custom(Roboto.regular.rawValue, size: 12))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    
                    .onTapGesture {
                        model.showTerms()
                    }
            }
            .frame(height: 30, alignment: .top)
            .padding(.leading, 24)
            .padding(.trailing, 70)
            
            Spacer()
                .frame(maxHeight: 64)
            
            BlueButton(action: {}, text: "Sign Up")
                .padding(.bottom, 8)
            
            underBlue(descr: "Already have an account?", buttonLabel: "Sign in", action: {model.signIn()})
            
            Spacer()
                .frame(maxHeight: 30)
            
            google(action: {model.rootModel.colorMode = .dark})
                .padding(.bottom, 10)
            
            .sheet(isPresented: $model.isShow, onDismiss: {model.dismiss()} , content: {
                VStack {
                    HStack {
                        Button(action: {model.dismiss()}, label: {
                            Text("Закрыть")
                        })
                        .padding(.leading, 20)
                        
                        Spacer()
                    }
                    
                    PDFViewRepresentable(data: model.dataOfTerms!)
                }
            })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(r: RootModel())
    }
}
