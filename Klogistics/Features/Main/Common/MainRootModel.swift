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
    
    @Published var isShowTabbar = true
    @Published var activeTab: Tabs = .Home
    
    
    //topbar
    @Published var isShowTopbar = false
    @Published var titleTopbar = ""
    @Published var isButtonInTopbar = false
    @Published var topBarAction = {}
    
    func home() {
        clear()
        
        activeTab = .Home
        current = .home
    }
    
    func wallet() {
        clear()
        
        activeTab = .Wallet
        current = .wallet
    }
    
    func track() {
        clear()
        
        activeTab = .Track
        current = .track
    }
    
    func profile() {
        activeTab = .Profile
        current = .profile
        
        isShowTopbar = true
        titleTopbar = "Profile"
    }
    
    
    func clear() {
        titleTopbar = ""
        isShowTopbar = false
    }
}
