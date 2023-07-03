//
//  ContentView.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var rootModel: RootModel
    init(rootModel: RootModel) {
        self.rootModel = rootModel
    }
    
    var body: some View {
        switch rootModel.current {
        case .onboarding: OnboardingView(r: rootModel)
        case .signUp: SignUpView(r: rootModel)
        case .logIn: LogInView(r: rootModel)
        case .forgotPassword: ForgotPasswordView(r: rootModel)
        case .verify: VerifyView(r: rootModel)
        case .newPass: NewPassView(r: rootModel)
        
        default: supabase_testView()
        }
    }
}
