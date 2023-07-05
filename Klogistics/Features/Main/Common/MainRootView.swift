//
//  MainRootView.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import SwiftUI

struct MainRootView: View {
    @ObservedObject var mainRootModel: MainRootModel
    init(r: RootModel) {
        mainRootModel = MainRootModel(r: r)
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                if mainRootModel.isShowTopbar {
                    topBar(title: mainRootModel.titleTopbar, isButton: mainRootModel.isButtonInTopbar, action: mainRootModel.topBarAction)
                        .ignoresSafeArea(.all)
                }
                
//                if true {
//                    topBar(title: "Home", isButton: true, action: mainRootModel.topBarAction)
//                        .ignoresSafeArea(.all)
//                }
                
                switch mainRootModel.current {
                case .home: HomeView(m: mainRootModel)
                case .profile: ProfileView(m: mainRootModel)
                case .notification: NotificationView(m: mainRootModel)
                default: EmptyView()
                }
                
                
                if mainRootModel.isShowTabbar {
                    Tabbar(tab1: {mainRootModel.home()}, tab2: {mainRootModel.wallet()}, tab3: {mainRootModel.track()}, tab4: {mainRootModel.profile()}, active: mainRootModel.activeTab)
                }
            }
            
            
        }
    }
}

struct MainRootView_Previews: PreviewProvider {
    static var previews: some View {
        MainRootView(r: RootModel())
    }
}
