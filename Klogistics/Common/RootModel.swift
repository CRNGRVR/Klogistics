//
//  NavModel.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import Foundation

class RootModel: ObservableObject {
    @Published var current: Screens = .onboarding
}
