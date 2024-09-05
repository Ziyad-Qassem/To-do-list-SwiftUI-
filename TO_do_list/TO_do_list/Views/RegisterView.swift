//
//  RegisterView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct RegisterView: View {
//     @State private var userName : String = ""
//     @State private var userEmail : String = ""
//     @State private var userPassword : String = ""
  @StateObject  var viewModel  = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            // header
            HeaderView(title: "Register", subtitle: "Start organizing your life ", angel: -20, backgoundColor: .orange)
            
            // registration form
            
              
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                    }
                    
                    
                    TextField("Your Name", text: $viewModel.userName)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    
                    
                    TextField("Your Email", text: $viewModel.userEmail)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    
                    SecureField("Create Passwrod", text: $viewModel.userPassword)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    
                     

                    TDLButton(title: "Create Account", buttonColor: .green) {
                        // Action
                        viewModel.registerUser()
                        
                        
                    }
                    
                }.offset(y: -30)
     
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
