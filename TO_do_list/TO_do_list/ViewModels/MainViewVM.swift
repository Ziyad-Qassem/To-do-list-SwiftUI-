//
//  MainViewVM.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import Foundation
import FirebaseAuth
class MainViewViewModel : ObservableObject {
    @Published var currentUserId : String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    init () {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    
    var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
