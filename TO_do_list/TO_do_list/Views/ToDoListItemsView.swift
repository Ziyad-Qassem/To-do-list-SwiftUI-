//
//  ToDoListItemsView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel  = ToDoListViewViewModel()
    private  let userId  : String
    init (userId : String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button(action: {
                    // go to  new task view to add a new to do task
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

#Preview {
    ToDoListItemsView(userId: "")
}
