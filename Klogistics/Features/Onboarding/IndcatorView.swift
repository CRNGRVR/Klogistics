//
//  IndcatorView.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import SwiftUI

struct IndcatorView: View {
    var model: OnboardingModel
    
    var body: some View {
        HStack(spacing: 9) {
            Image(model.activeTabs[0] ? "a" : "na")
            Image(model.activeTabs[1] ? "a" : "na")
            Image(model.activeTabs[2] ? "a" : "na")
        }
    }
}
