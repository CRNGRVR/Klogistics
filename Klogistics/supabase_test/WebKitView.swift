//
//  WebKitView.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import Foundation
import UIKit
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> some UIView {
        let wk = WKWebView()
        let req = URLRequest(url: url)
        wk.load(req)
        return wk
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
