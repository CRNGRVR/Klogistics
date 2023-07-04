//
//  ForgotPasswordModel.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import Foundation

class ForgotPasswordModel: ObservableObject {
    @Published var rootModel: RootModel
    init(r: RootModel) {
        self.rootModel = r
    }
    
    @Published var mail = ""
    
    func remember() {
        rootModel.current = .logIn
    }
    
    func send() {
        Task {
            rootModel.forgotVerify_mail = mail
            
            await SupabaseSingle.shared.signInVithOTP(mail: mail, onSuccess: {
                self.rootModel.current = .verify
            }, onFault: {err in
                print(err.localizedDescription)
            })
        }
    }
}
