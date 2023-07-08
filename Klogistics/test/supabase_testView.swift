//
//  supabase_testView.swift
//  Klogistics
//
//  Created by Иван on 29.06.2023.
//

import SwiftUI

struct supabase_testView: View {
    @ObservedObject var model = Supabase_testModel()
    
    var body: some View {
        ZStack {
            
            VStack {
                Button(action: {model.insertData()}, label: {
                    Text("insert")
                })
                
                Button(action: {model.selectALL()}, label: {
                    Text("select all")
                })
                
                Button(action: {model.select900()}, label: {
                    Text("where 900")
                })
                
                Button(action: {model.updateAll900To850()}, label: {
                    Text("Update 900 to 850")
                })
                
                Button(action: {model.deleteWhere22()}, label: {
                    Text("delete where age == 22")
                })
                
                Button(action: {model.reg()}, label: {
                    Text("register")
                })
                
                
                
                Group {
                    Button(action: {model.login()}, label: {
                        Text("login")
                    })
                    Button(action: {model.logout()}, label: {
                        Text("logout")
                    })
                    Button(action: {model.info()}, label: {
                        Text("session")
                    })
                    
                    
                    Button(action: {model.forgot()}, label: {
                        Text("forgot")
                    })
                    
                    TextField("", text: $model.txt)
                        .border(Color.gray)
                    
                    Button(action: {model.otpSignIn()}, label: {
                        Text("send code")
                    })
                    
                    Button(action: {model.userUpdate()}, label: {
                        Text("set password to 101010")
                    })
                    
                    Button(action: {model.signInwithGoogle()}, label: {
                        Text("gogil")
                    })
                    
                    Button(action: {model.getKniga()}, label: {
                        Text("get книга")
                    })
                }
            
                .sheet(isPresented: $model.showKniga, content: {
                    //PDFViewRepresentable(data: model.dataOfKniga!)
                    PDFByLinkViewRepresentable(url: getPdfUrl(name: "1")!)
                })
                
                
            }
            
            if model.isShowSafari {
                ZStack {
                    WebView(url: model.url!)
                    VStack {
                        HStack {
                            Button(action: {model.isShowSafari = false}, label: {Text("Закрыть")})
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        .padding(.top, 20)
                        
                        Spacer()
                    }
                }
            }

        }
    }
}

struct supabase_testView_Previews: PreviewProvider {
    static var previews: some View {
        supabase_testView()
    }
}
