//
//  supabase_testModel.swift
//  Klogistics
//
//  Created by Иван on 29.06.2023.
//

import Foundation
import Supabase
import GoTrue


class Supabase_testModel: ObservableObject {
    
    @Published var all: [UserData] = []
    var client = SupabaseClient(supabaseURL: URL(string: "https://ctndmzopmnohfkgjwlmo.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN0bmRtem9wbW5vaGZrZ2p3bG1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4ODA1NDIxOSwiZXhwIjoyMDAzNjMwMjE5fQ.BDtTBuqfUmFB6cnUaXVCjdr1kV30gZ1XLgc4lurksCI")
    
    @Published var isShowSafari = false
    var url: URL?
    
    @Published var showKniga = false
    var dataOfKniga: Data?
    
    func insertData() {
        let inserted = UserData(id: nil, name: "second", phone: "8888888", age: 900)
        let query = client.database.from("Users").insert(values: inserted)
        
        Task {
            do {
                try await query.execute()
                print("after exec")
            } catch {
                
                if error.localizedDescription == "The Internet connection appears to be offline." {
                    print("\n\nИнтернеты кончились\n\n")
                    //  Обработка отсутствия интернета
                } else {
                    print(error.localizedDescription)
                }
            }
            print("finish")
        }
    }
    
    

    
    
    
    func selectALL() {
//        let query = client.database.from("Users").select()
//
//        DispatchQueue.main.async {
//            Task {
//                do {
//                    self.all = try await query.execute().value
//                } catch {
//                    print(error.localizedDescription)
//                }
//
//                print(self.all)
//            }
//        }
        
        print("1")
        
        Task {
            print("2")
            all = await SupabaseSingle.shared.selectALLr()
            print("3")
        }
        print("4")
    }
    
    
    func select900() {
        let query = client.database.from("Users").select().equals(column: "age", value: "900").equals(column: "name", value: "second")
        
        DispatchQueue.main.async {
            Task {
                do {
                    self.all = try await query.execute().value
                } catch {
                    print(error.localizedDescription)
                }
                
                print(self.all)
            }
        }
    }
    
    
    func updateAll900To850() {
        let query = client.database.from("Users").update(values: UserData(id: nil, name: nil, phone: nil, age: 850)).equals(column: "age", value: "900")
        
        Task {
            do {
                try await query.execute()
                print("success")
            }
        }
    }
    
    func deleteWhere22() {
        let query = client.database.from("Users").delete().equals(column: "age", value: "22")
        
        Task {
            do {
                try await query.execute()
                print("deleted")
            }
        }
    }
    
    
    
    func reg() {
        Task {
            do {
                try await client.auth.signUp(email: "85391240o@gmail.com", password: "123456", data: [
                    "name": .string("oleg"),
                    "phone": .string("888888")
                ])
                
                print("done")
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func login() {
        Task {
            do {
                try await client.auth.signIn(email: "85391240o@gmail.com", password: "123456")
                print("done")
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
        Task {
            do {
                try await client.auth.signOut()
                print("done")
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func info() {
        Task {
            do {
                let session = try await client.auth.session
                print("info: \(session)")
            }
            catch {
                print("session fault")
            }
        }
    }
    
    
    func forgot() {
        Task {
            do {
                try await client.auth.signInWithOTP(email: "85391240o@gmail.com")
                print("done")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @Published var txt = ""
    
    func otpSignIn() {
        Task {
            do {
                try await client.auth.verifyOTP(email: "85391240o@gmail.com", token: txt, type: .recovery)
                print("done")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func userUpdate() {
        Task {
            try await client.auth.update(user: UserAttributes(password: "101010"))
            print("done")
        }
    }
    
    
    func signInwithGoogle() {
        Task {
            do {
                url = try client.auth.getOAuthSignInURL(provider: .google, redirectTo: URL(string: "https://ctndmzopmnohfkgjwlmo.supabase.co/auth/v1/callback"))
                print(url?.absoluteString)
               // DispatchQueue.main.async {
                    self.isShowSafari.toggle()
                //}
                
                print("done")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getKniga() {
//        Task {
//            dataOfKniga = await SupabaseSingle.shared.downloadBook()
//            showKniga = true
//        }
        
        
        showKniga.toggle()
    }
}

//От супабазы
//ZFDbBBLst4F892ff

struct UserData: Encodable, Decodable {
    let id: Int?
    let name: String?
    let phone: String?
    let age: Int?
}


func getPdfUrl(name: String) -> URL? {
    if let url = Bundle.main.url(forResource: "1", withExtension: "pdf") {
        return url
    }
    
    return nil
}
