//
//  SupabaseClient.swift
//  Klogistics
//
//  Created by Иван on 03.07.2023.
//

import Foundation
import Supabase
import GoTrue

struct SupabaseSingle {
    static let shared = SupabaseSingle()
    
    var client = SupabaseClient(supabaseURL: URL(string: "https://ctndmzopmnohfkgjwlmo.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN0bmRtem9wbW5vaGZrZ2p3bG1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4ODA1NDIxOSwiZXhwIjoyMDAzNjMwMjE5fQ.BDtTBuqfUmFB6cnUaXVCjdr1kV30gZ1XLgc4lurksCI")
    
    func selectALLr() async -> [UserData] {
        let query = client.database.from("Users").select()
        var data: [UserData] = []
        
        do {
            data = try await query.execute().value
            return data
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    //  Terms
    func downloadBook() async -> Data? {
        do {
            return try await client.storage.from(id: "Document").download(path: "book.pdf")
        } catch {
            print("fault")
            return nil
        }
    }
    
    func signUp(name: String, phone: String, mail: String, password: String, completion: @escaping () -> Void) async {
        do {
            try await client.auth.signUp(email: mail, password: password, data: ["name": .string(name), "phone" : .string(phone)])
            completion()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func logIn(mail: String, password: String, onSucces: @escaping () -> Void, onFault: @escaping (Error) -> Void) async {
        do {
            try await client.auth.signIn(email: mail, password: password)
            onSucces()
        } catch {
            onFault(error)
        }
    }
    
    func signInVithOTP(mail: String, onSuccess success: @escaping () -> Void, onFault fault: @escaping (Error) -> Void) async {
        do {
            try await client.auth.signInWithOTP(email: mail)
            success()
        } catch {
            fault(error)
        }
    }
    
    func verify(mail: String, code: String, onSuccess success: @escaping () -> Void, onFault fault: @escaping (Error) -> Void) async {
        do {
            try await client.auth.verifyOTP(email: mail, token: code, type: .recovery)
            success()
        } catch {
            fault(error)
        }
    }
    
    func setNewPassword(newPassword: String, onSuccess success: @escaping () -> Void, onFault fault: @escaping (Error) -> Void) async {
        do {
            try await client.auth.update(user: .init(password: newPassword))
            success()
        } catch {
            fault(error)
        }
    }
    
    
    func downloadAllImages() async{
        do {
            let files = try await client.storage.from(id: "Document").list(path: "ad/")
            for item in files {
                print(item)
            }
        } catch {
            
        }
    }
}
