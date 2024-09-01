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
            ZStack {
              
                Form {
                    TextField("Your Name", text: $userName)
                    TextField("Your Email", text: $userEmail)
                    SecureField("Create Passwrod", text: $userPassword)
                    
                    Button(action: {
                        // registration code
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10 )
                                .foregroundColor(.green)
                            
                            Text("Create Account")
                                .foregroundStyle(.white)
                                .bold()
                                
                        }
                    })
                }
            }
           
            
            
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
