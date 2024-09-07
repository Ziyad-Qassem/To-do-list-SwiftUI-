//
//  profileView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct profileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                if let user = viewModel.user {
                    // Avater Image
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .frame(width: 100 , height: 125)
                    
                    // user info
                    VStack {
                        // user name
                        HStack{
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }.padding()
                        // email info
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }.padding()
                        // user join in date
                        HStack {
                            Text("Member Since :")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened ))")
                        }.padding()
                    }.padding()
                    
                    // sign out button
                    Button("Log Out") {
                        // log user out
                        viewModel.logOut()
                        
                    }.tint(.red)
                        .padding()
                    
                    
                    Spacer()
                }else {
                    Text("Loading profile Information")
                }
                  
                    
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.getUserInfo()
        }
    }
}

#Preview {
    profileView()
}
