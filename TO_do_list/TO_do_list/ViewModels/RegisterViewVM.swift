//
//  RegisterViewVM.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//
//@State private var userName : String = ""
//@State private var userEmail : String = ""
//@State private var userPassword : String = ""
import Foundation
import FirebaseFirestore
import FirebaseAuth
class RegisterViewViewModel : ObservableObject {
     @Published var userName : String = ""
     @Published var userEmail : String = ""
     @Published var userPassword : String = ""
    @Published var errorMessage : String = ""
    init() {
        
    }
    
    func registerUser() {
        guard checkUserInfo() else {
            return
        }
       
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) {[weak self]result, error  in
            guard let userId = result?.user.uid else {
                return
            }
            self?.addUserRecord(userId : userId)
            
        }
        
        
    }
    
    private func addUserRecord (userId : String) {
        let newUser = User(id: userId, name: userName, email: userEmail, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("Users")
            .document(userId)
            .setData(newUser.asDictionary())
    }
    
    func checkUserInfo()  -> Bool{
        guard !userName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty , !userEmail.trimmingCharacters(in: .whitespaces).isEmpty , !userPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "please fill in all the text fields"
            return false
        }
        
        
        guard userEmail.contains("@") && userEmail.contains(".") else {
            errorMessage = "please enter a vaild email"
            return false
        }
        
        guard userPassword.count >= 6 else {
            errorMessage = "your password is too short"
            return false
        }
         
        return true
    }
    
}
