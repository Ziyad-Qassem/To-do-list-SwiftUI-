//
//  LoginView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email : String = ""
    @State var Password : String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "To Do List ", subtitle: "Get things done", angel: 20, backgoundColor: .pink)
                
                // login form
                
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    SecureField("password", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()

                    TDLButton(title: "Log In", buttonColor: .blue) {
                        // Action
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
