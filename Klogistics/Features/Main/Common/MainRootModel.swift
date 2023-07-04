//
//  MainRootModel.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import Foundation

class MainRootModel: ObservableObject {
    @Published var rootModel: RootModel
    init(r: RootModel) {
        self.rootModel = r
    }
    
    @Published var current: MainScreens = .home
}
