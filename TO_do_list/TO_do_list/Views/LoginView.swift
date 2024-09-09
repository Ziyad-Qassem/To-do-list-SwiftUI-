//
//  LoginView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel  = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "To Do List ", subtitle: "Get things done", angel: 20, backgoundColor: .pink)
                
                // warning
              
                // login form
                
                Form{
                    if !viewModel.errormessage.isEmpty {
                        Text(viewModel.errormessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()

                    TDLButton(title: "Log In", buttonColor: .blue) {
                        // Action
                        viewModel.login()
                    }
                }
                
                // create Account
                
                
                VStack {
                     Text(" You don't have an account? 😱")
                        .font(.system(size: 18) )
                  NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom , 50)
                    Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
