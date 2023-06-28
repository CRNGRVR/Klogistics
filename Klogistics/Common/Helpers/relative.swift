//
//  relative.swift
//  Klogistics
//
//  Created by Иван on 28.06.2023.
//

import Foundation
import UIKit

func relative(_ pixels: CGFloat, _ axis: axis) -> CGFloat{

    let layout_width: CGFloat = 390
    let layout_height: CGFloat = 844
    
    let current_width = UIScreen.main.bounds.width
    let current_height = UIScreen.main.bounds.height
    
    let factor_width = current_width / layout_width
    let factor_height = current_height / layout_height
    
    switch axis {
    case .w: return pixels * factor_width
    case .h: return pixels * factor_height
    }
}

enum axis {
    case h
    case w
}
