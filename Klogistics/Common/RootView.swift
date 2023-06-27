//
//  ContentView.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var rootModel = RootModel()
    
    var body: some View {
        switch rootModel.current {
        case .onboarding: EmptyView()
        }
    }
}
