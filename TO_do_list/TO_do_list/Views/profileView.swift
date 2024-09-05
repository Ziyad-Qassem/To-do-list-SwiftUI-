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
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    profileView()
}
