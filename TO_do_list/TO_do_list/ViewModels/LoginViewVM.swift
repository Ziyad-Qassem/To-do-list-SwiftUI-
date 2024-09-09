//
//  LoginViewVM.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel : ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errormessage : String = ""
    init(){
        
    }
    
    func login() {
        // Login the user
        
        errormessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty , !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errormessage = "please leave no empty text field"
            return
        }
        
        guard !email.contains("@") && email.contains(".") else {
            errormessage = "please enter a vaild email"
            return
        }
        
        
        
        print("success from login in model")
        
    }
    func validate() {
        // validate the user info
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
}

