//
//  NavModel.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import Foundation
import SwiftUI

class RootModel: ObservableObject {
    @Published var current: Screens = .e//.main // .onboarding
    
    @Published var colorMode: ColorScheme = .light
    
    
    //  Forgot -> Verify/NewPass
    var forgotVerify_mail = ""
}
