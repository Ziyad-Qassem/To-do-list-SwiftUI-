//
//  RegisterView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct RegisterView: View {
     @State private var userName : String = ""
     @State private var userEmail : String = ""
     @State private var userPassword : String = ""
    
    var body: some View {
        VStack{
            // header
            HeaderView(title: "Register", subtitle: "Start organizing your life ", angel: -20, backgoundColor: .orange)
            
            // registration form
            
              
                Form {
                    TextField("Your Name", text: $userName)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    TextField("Your Email", text: $userEmail)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    SecureField("Create Passwrod", text: $userPassword)
                     

                    TDLButton(title: "Create Account", buttonColor: .green) {
                        // Action
                    }
                    
                }.offset(y: -30)
     
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
