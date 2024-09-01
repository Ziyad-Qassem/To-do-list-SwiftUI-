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
                HeaderView()
                
                // login form
                
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    SecureField("password", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        // login code
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            
                            Button(action: {
                                // login code
                            }, label: {
                                Text("Log In")
                                    .foregroundStyle(.white)
                                    .bold()
                            })
                        }
                    })
                }.padding()
                
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
