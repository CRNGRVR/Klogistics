//
//  NotificationModel.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import Foundation

class NotificationModel: ObservableObject {
    @Published var mainRootModel: MainRootModel
    init(m: MainRootModel) {
        self.mainRootModel = m
    }
}
