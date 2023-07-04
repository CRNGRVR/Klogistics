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
    
    
    func fill() {
        queue.append(OnboardingItem(title: "Quick Delivery At Your Doorstep", descr: "Enjoy quick pick-up and delivery to your destination", image: "b1"))
        queue.append(OnboardingItem(title: "Flexible Payment", descr: "Different modes of payment either before and after delivery without stress", image: "b2"))
        queue.append(OnboardingItem(title: "Real-time Tracking", descr: "Track your packages/items from the comfort of your home till final destination", image: "b3"))
    }
    
    func next() {
        queue.remove(at: 0)
        activeTab += 1
        
        if queue.count == 1 {
            isShowLogin = true
        }
    }
    
    func skip() {}
    
    func signUp() {
        if queue.count == 1 {
            rootModel.current = .signUp
        }
    }
    
    func signIn() {
        rootModel.current = .logIn
    }
}
