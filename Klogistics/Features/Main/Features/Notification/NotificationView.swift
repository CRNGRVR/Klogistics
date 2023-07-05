//
//  NotificationView.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var model: NotificationModel
    init(m: MainRootModel) {
        model = NotificationModel(m: m)
    }
    
    var body: some View {
        Button(action: {model.mainRootModel.current = .profile; model.mainRootModel.isShowTabbar = true}, label: {
            Text("back")
        })
    }
}

//struct NotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationView()
//    }
//}
