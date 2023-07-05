//
//  HomeModel.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import Foundation

class HomeModel: ObservableObject {
    @Published var mainRootModel: MainRootModel
    init(m: MainRootModel) {
        self.mainRootModel = m
    }
    
}
