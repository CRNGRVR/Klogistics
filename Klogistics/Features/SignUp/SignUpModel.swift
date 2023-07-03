//
//  SignUpModel.swift
//  Klogistics
//
//  Created by Иван on 02.07.2023.
//

import Foundation

class SignUpModel: ObservableObject {
    
    @Published var rootModel: RootModel
    init(r: RootModel) {
        self.rootModel = r
    }
    
    //  Terms
    @Published var isAgree = false
    @Published var isShow = false
    var dataOfTerms: Data?
    var isClickedYet = false
    
    //  Fields
    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var mail: String = ""
    @Published var password: String = ""
    @Published var showPassword = false
    
    func tapCheck() {
        isAgree.toggle()
    }
    
    func showTerms() {
        if !isClickedYet {
            isClickedYet = true
            
            Task {
                if let data = await SupabaseSingle.shared.downloadBook() {
                    self.dataOfTerms = data //  В бакете лежит книга Камрана Амини, просто первый PDF-файл, что попался под руку
                    isShow = true
                } else {
                    print("Капец")
                }
            }
        }
    }
    
    func dismiss() {
        isShow = false
        isClickedYet = false
    }
    
    func signIn() {
        rootModel.current = .logIn
    }
    
    func signUp() {}
}
