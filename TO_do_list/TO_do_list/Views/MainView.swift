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
            
            ToDoListItemsView()
        }
        else {
            
            LoginView()
        }
     
    }
}

#Preview {
    MainView()
}
