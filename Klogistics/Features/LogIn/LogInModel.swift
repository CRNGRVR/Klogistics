//
//  LogInModel.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import Foundation

class LogInModel: ObservableObject {
    @Published var rootModel: RootModel
    init(r: RootModel) {
        self.rootModel = r
    }
    
    @Published var mail = ""
    @Published var password = ""
    
    func backToSignUp() {
        rootModel.current = .signUp
    }
    
    func forgotPassword() {
        rootModel.current = .forgotPassword
    }
    
    func logIn() {
        Task {
            await SupabaseSingle.shared.logIn(mail: mail, password: password, onSucces: {
                self.rootModel.current = .main
            }, onFault: { err in
                print(err.localizedDescription)
            })
        }
    }
}
