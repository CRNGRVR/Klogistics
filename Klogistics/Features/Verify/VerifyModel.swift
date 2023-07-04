//
//  VerifyModel.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import Foundation

class VerifyModel: ObservableObject {
    @Published var rootModel: RootModel
    init(r: RootModel) {
        self.rootModel = r
    }
    
    @Published var d1 = ""
    @Published var d2 = ""
    @Published var d3 = ""
    @Published var d4 = ""
    @Published var d5 = ""
    @Published var d6 = ""
    
    var digits: String {
        return "\(d1)\(d2)\(d3)\(d4)\(d5)\(d6)"
    }
    
    
    func resend() {
        Task {
            await SupabaseSingle.shared.signInVithOTP(mail: rootModel.forgotVerify_mail, onSuccess: {}, onFault: {err in
                print(err.localizedDescription)
            })
        }
    }
    
    func goToSetNew() {
        Task {
            await SupabaseSingle.shared.verify(mail: rootModel.forgotVerify_mail, code: digits, onSuccess: {
                self.rootModel.current = .newPass
            }, onFault: {err in
                print(err.localizedDescription)
            })
        }
    }
}

