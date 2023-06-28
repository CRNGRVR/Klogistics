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
        VStack {
            Spacer()

            Image("b1")

            
            Text("Quick Delivery At Your\n Doorstep")
                .font(.custom(Roboto.bold.rawValue, size: 24))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Blue"))
                .padding(.bottom, 17)
                .layoutPriority(1)
            
            Text("Enjoy quick pick-up and delivery to \nyour destination")
                .font(.custom(Roboto.regular.rawValue, size: 16))
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        
            Spacer()
                .frame(maxHeight: 49)
            
            IndcatorView(model: onboardingModel)
    
            Spacer()
                .frame(maxHeight: 82)
        
            
            HStack {
                Button(action: {}, label: {
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
                
                Button(action: {}, label: {
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
            
            Spacer()
                .frame(maxHeight: 70)
           
        }
        .ignoresSafeArea(.all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(r: RootModel())
    }
}
