//
//  OnboardingView.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var onboardingModel: OnboardingModel
    init(r: RootModel) {
        self.onboardingModel = OnboardingModel(rootModel: r)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(onboardingModel.queue.first?.image ?? "")
                
            
            Spacer()
                .frame(maxHeight: 50)
            Text(onboardingModel.queue.first?.title ?? "")
                .frame(height: 60, alignment: .center)
                .font(.custom(Roboto.bold.rawValue, size: 24))
                .foregroundColor(Color("Blue"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
                .padding([.leading, .trailing], 60)
             
              
            Text(onboardingModel.queue.first?.descr ?? "")
                .frame(height: 60, alignment: .top)
                .font(.custom(Roboto.regular.rawValue, size: 16))
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 44)
            
                

            Spacer()
                .frame(maxHeight: 49)
            
            IndcatorView(model: onboardingModel)
            
            Spacer()
                .frame(maxHeight: 70)
            
            if onboardingModel.isShowLogin {
                signUpButtons
                    
            } else {
                skipNextButtons
                    
            }
                
            // 70 47
            Spacer()
                .frame(maxHeight: onboardingModel.isShowLogin ? 47 : 70)
                
        }
        .ignoresSafeArea(.all)
    }
}


extension OnboardingView {
    var signUpButtons: some View {
        VStack {
            Button(action: {onboardingModel.signUp()}, label: {
                ZStack {
                    Color("Blue")
                        .cornerRadius(5)
                    Text("Sign Up")
                        .font(.custom(Roboto.bold.rawValue, size: 16))
                        .foregroundColor(.white)
                }
                .frame(height: 46)
            })
            .padding([.leading, .trailing], 24)
            
            HStack(spacing: 2) {
                Text("Already have an account?")
                    .font(.custom(Roboto.regular.rawValue, size: 14))
                    .foregroundColor(.gray)
                
                Button(action: {onboardingModel.signIn()}, label: {
                    Text("Sign in")
                        .font(.custom(Roboto.medium.rawValue, size: 14))
                        .foregroundColor(Color("Blue"))
                })
            }
        }
    }
    
    
    var skipNextButtons: some View {
        HStack {
            Button(action: {onboardingModel.skip()}, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("Blue"), lineWidth: 1)
                    
                    Text("Skip")
                        .font(.custom(Roboto.bold.rawValue, size: 10))
                        .foregroundColor(Color("Blue"))
                }
                .frame(width: 56, height: 29)
            })
            .padding(.leading, 23)
            
            Spacer()
            
            Button(action: {onboardingModel.next()}, label: {
                ZStack {
                    Color("Blue")
                        .cornerRadius(5)
                    
                    Text("Next")
                        .font(.custom(Roboto.bold.rawValue, size: 10))
                        .foregroundColor(.white)
                }
                .frame(width: 56, height: 29)
            })
            .padding(.trailing, 23)
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(r: RootModel())
    }
}
