//
//  KlogisticsApp.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import SwiftUI

@main
struct KlogisticsApp: App {
    @ObservedObject var rootModel = RootModel()
    
    var body: some Scene {
        WindowGroup {
            RootView(rootModel: rootModel)
                .preferredColorScheme(rootModel.colorMode)
        }
    }
}
