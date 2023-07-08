//
//  TopBottom.swift
//  Klogistics
//
//  Created by Иван on 06.07.2023.
//

import Foundation

class Topbar: ObservableObject {
    
    @Published var isShowTopbar = false
    var topbarTitle = ""
    var isTopbarHaveButton = false
    var backButtonAction: () -> Void = {}
    
    func clearTopbar() {
        isShowTopbar = false
        isTopbarHaveButton = false
        topbarTitle = ""
    }
    
    func setTopbar(title: String, backButton: Bool , action: @escaping () -> Void) {
        topbarTitle = title
        isTopbarHaveButton = backButton
        backButtonAction = action
        isShowTopbar = true
    }
}
