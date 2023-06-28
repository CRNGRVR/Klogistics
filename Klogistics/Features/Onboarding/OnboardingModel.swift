//
//  OnboardingModel.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import Foundation

class OnboardingModel: ObservableObject {
    @Published var rootModel: RootModel
    @Published var queue: [OnboardingItem] = []
    @Published var isShowLogin = false
    @Published var activeTabs: [Bool] = [true, false, false]
    
    init(rootModel: RootModel) {
        self.rootModel = rootModel
    }
    
    
    func fill() {}
    func retrieve() {}
    func skip() {}
    func signUp() {}
}
