//
//  ProfileView.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var model: ProfileModel
    init(m: MainRootModel) {
        model = ProfileModel(m: m)
    }
    
    var body: some View {
        VStack {
            Button(action: {model.incr()}, label: {
                Text(String(model.num))
            })
            Button(action: {model.hide()}, label: {Text("tab")})
            
            Spacer()
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
