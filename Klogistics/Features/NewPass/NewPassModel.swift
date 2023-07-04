//
//  NewPassModel.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import Foundation

class NewPassModel: ObservableObject {
    @Published var rootModel: RootModel
    init(r: RootModel) {
        self.rootModel = r
    }
    
    @Published var newPass = ""
    @Published var conformition = ""
    
    func setNew() {
        if newPass == conformition {
            Task {
                await SupabaseSingle.shared.setNewPassword(newPassword: newPass, onSuccess: {
                    self.rootModel.current = .main
                }, onFault: { err in
                    print(err.localizedDescription)
                })
            }
        }
    }
}
