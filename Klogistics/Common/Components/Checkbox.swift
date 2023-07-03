//
//  Checkbox.swift
//  Klogistics
//
//  Created by Иван on 02.07.2023.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Image(isChecked ? "ch" : "nch")
            .onTapGesture {
                isChecked.toggle()
            }
    }
}
