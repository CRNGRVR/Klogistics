//
//  HomeView.swift
//  Klogistics
//
//  Created by Иван on 04.07.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                find(txt: .constant(""))
                    .padding(.top, relative(24, .h))
                    .padding(.bottom, relative(24, .h))
                
                hello(name: "Oleg", action: {})
                    .padding(.bottom, relative(39, .h))
                
                special()
                    .padding(.bottom, relative(19, .h))
                
                HStack {
                    Text("What would you like to do")
                        .padding(.leading, 25)
                        .font(.custom(Roboto.medium.rawValue, size: 14))
                        .foregroundColor(Color("Blue"))
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        qButton(title: "Customer Care", subtitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today", image: "bq2", action: {})
                        
                        Spacer()
                        
                        qButton(title: "Customer Care", subtitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today", image: "bq3", action: {})
                    }
                    .padding(.bottom, relative(24, .h))
                    
                    
                    HStack {
                        qButton(title: "Customer Care", subtitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today", image: "bq1", action: {})
                        
                        Spacer()
                        
                        qButton(title: "Customer Care", subtitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today", image: "bq4", action: {})
                    }
                }
                .padding([.leading, .trailing], 24)
            }
            .padding(.bottom, 100)
        }
    }
}


struct find: View {
    @Binding var txt: String
    
    var body: some View {
        ZStack {
            Color("find")
                .cornerRadius(4)
            
            HStack {
                TextField("Search services", text: $txt)
                    .padding(.leading, 12)
                
                Spacer()
                
                Image("search")
                    .padding(.trailing, 10)
            }
        }
        .frame(height: 34)
        .padding([.leading, .trailing], 24)
    }
}


struct hello: View {
    var name: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color("Blue")
                .cornerRadius(8)
            
            HStack {
                VStack {
                    Spacer()
                    Image("c1")
                }
                
                Spacer()
                
                VStack {
                    Image("c2")
                    Spacer()
                }
            }
            .cornerRadius(8)
            
            HStack {
                VStack {
                    HStack {
                        Text("Hello \(name)")
                            .font(.custom(Roboto.medium.rawValue, size: 24))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("We trust you are having a great time")
                            .font(.custom(Roboto.regular.rawValue, size: 12))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
                .padding(.leading, 12)
                
                Spacer()
                
                Button(action: {action()}, label: {
                    Image("bell")
                })
                .padding(.trailing, 17)
            }
        }
        .frame(height: 91)
        .padding([.leading, .trailing], 24)
    }
}



struct special: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Special for you")
                    .font(.custom(Roboto.medium.rawValue, size: 14))
                    .foregroundColor(Color("Warning"))
                
                Spacer()
                
                Button(action: {}, label: {
                    Image("arrow")
                })
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Image("ad1")
                    Image("ad2")
                }
            }
            .frame(height: 64)

        }
        .padding([.leading, .trailing], 24)
    }
}


struct qButton: View {
    var title: String
    var subtitle: String
    var image: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {}, label: {
            ZStack {
                Color("g")
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 2)
                
                VStack {
                    HStack {
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding(.leading, 12)
                            
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(title)
                            .font(.custom(Roboto.medium.rawValue, size: 16))
                            .padding(.leading, 12)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(subtitle)
                            .font(.custom(Roboto.regular.rawValue, size: 8))
                            .foregroundColor(.black)
                            .frame(width: 128)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 12)
                        
                        Spacer()
                    }
                }
            }
            .frame(width: 159, height: 159)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
