//
//  ProfileModel.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import Foundation

class ProfileModel: ObservableObject {
    @Published var mainRootModel: MainRootModel
    init(m: MainRootModel) {
        self.mainRootModel = m
    }
    
    @Published var num = 1
    
    func incr() {
        num += 1
    }
    
    func hide() {
        mainRootModel.isShowTabbar = false
        mainRootModel.current = .notification
    }
}
