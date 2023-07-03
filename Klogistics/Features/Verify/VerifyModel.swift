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
    
    
}

