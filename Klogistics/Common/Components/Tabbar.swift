//
//  Tabbar.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import SwiftUI

struct Tabbar: View {
    let tab1: () -> Void
    let tab2: () -> Void
    let tab3: () -> Void
    let tab4: () -> Void
    
    var active: Tabs
    
    var body: some View {
//        VStack {
//            Spacer()
            
            ZStack {
                Color.white
                
                HStack {
                    Button(action: {tab1()}, label: {
                        VStack {
                            Image("Rect")
                                .opacity(active == .Home ? 1 : 0)
                            
                            Image(active == .Home ? "t1a" : "t1n")
                            
                            Text("Home")
                                .font(.custom(Roboto.regular.rawValue, size: 12))
                                .foregroundColor(active == .Home ? Color("Blue") : Color.gray)
                                .padding(.bottom, 9)
                        }
                    })
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    Button(action: {tab2()}, label: {
                        VStack {
                            Image("Rect")
                                .opacity(active == .Wallet ? 1 : 0)
                            
                            Image(active == .Wallet ? "t2a" : "t2n")
                            
                            Text("Wallet")
                                .font(.custom(Roboto.regular.rawValue, size: 12))
                                .foregroundColor(active == .Wallet ? Color("Blue") : Color.gray)
                                .padding(.bottom, 9)
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {tab3()}, label: {
                        VStack {
                            Image("Rect")
                                .opacity(active == .Track ? 1 : 0)
                            
                            Image(active == .Track ? "t3a" : "t3n")
                            
                            Text("Track")
                                .font(.custom(Roboto.regular.rawValue, size: 12))
                                .foregroundColor(active == .Track ? Color("Blue") : Color.gray)
                                .padding(.bottom, 9)
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {tab4()}, label: {
                        VStack {
                            Image("Rect")
                                .opacity(active == .Profile ? 1 : 0)
                            
                            Image(active == .Profile ? "t4a" : "t4n")
                            
                            Text("Profile")
                                .font(.custom(Roboto.regular.rawValue, size: 12))
                                .foregroundColor(active == .Profile ? Color("Blue") : Color.gray)
                                .padding(.bottom, 9)
                        }
                    })
                        .padding(.trailing, 16)
                }
            }
            .frame(height: 60)
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: -4)
        }
    //}
}

enum Tabs {
    case Home
    case Wallet
    case Track
    case Profile
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar(tab1: {}, tab2: {}, tab3: {}, tab4: {}, active: .Home)
    }
}
