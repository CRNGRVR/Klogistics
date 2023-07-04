//
//  NewPass.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import SwiftUI

struct NewPassView: View {
    @ObservedObject var model: NewPassModel
    init(r: RootModel) {
        model = NewPassModel(r: r)
    }
    
    var body: some View {
        VStack {
            TitleSubtitle(title: "New Password", subtitle: "Enter new password")
                .padding(.top, relative(110, .h))
                .padding(.bottom, relative(48, .h))
            
            sf(text: $model.newPass, descr: "New Password", placeholder: "**********")
                .padding(.bottom, relative(24, .h))
            
            sf(text: $model.conformition, descr: "Confirm Password", placeholder: "**********")
                .padding(.bottom, relative(93, .h))
            
            BlueButton(action: {model.setNew()}, text: "Log in")
            
            Spacer()
        }
    }
}
