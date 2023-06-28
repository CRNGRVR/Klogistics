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
    @Published var activeTab = 0
    
    init(rootModel: RootModel) {
        self.rootModel = rootModel
        fill()
    }
    
    
    func fill() {}
    func next() {}
    func skip() {}
    
    func signUp() {}
    func signIn() {}
}
