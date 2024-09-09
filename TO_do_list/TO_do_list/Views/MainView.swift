//
//  ContentView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModle = MainViewViewModel()
    var body: some View {
        if viewModle.isSignedIn , !viewModle.currentUserId.isEmpty {
            // user already signed in
            
           
            TabView{
                ToDoListItemsView(userId: viewModle.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                profileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }
        else {
            
            LoginView()
        }
     
    }
}

#Preview {
    MainView()
}
