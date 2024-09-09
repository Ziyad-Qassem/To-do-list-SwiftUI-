//
//  ProfileViewVM.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class ProfileViewViewModel : ObservableObject {
    @Published var user : User? = nil
    init() {
        
    }
    
    
    func getUserInfo() {
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(userId).getDocument {  [weak self] snapshot, error  in
            guard let data = snapshot?.data() , error == nil else {
                return
            }
            DispatchQueue.main.async {
                
                 print ()
                self?.user = User(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "" , email: data["email"] as? String ?? "" , joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
            
            
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(" falied to log out")
        }
    }
   
    
    
    
}

