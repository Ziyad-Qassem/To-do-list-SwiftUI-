//
//  ToDoListItemsView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI
import FirebaseFirestore
struct ToDoListItemsView: View {
    @StateObject var viewModel  = ToDoListViewViewModel()
    
    @FirestoreQuery var toDoTasks : [ToDoTask]
    @State private var newtaskpressed : Bool = false
 
    init (userId : String) {
       
        self._toDoTasks = FirestoreQuery(collectionPath: "Users/\(userId)/Tasks")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(toDoTasks){ item in
                   ToDoCellView(toDoTask: item)
                        .swipeActions{
                            Button {
                                // delete task from DB
                                viewModel.deleteTask(taskId: item.id)
                            }label: {
                                Text("Delete")
                                    
                            }.foregroundStyle(.red)
                        }
                    
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button(action: {
                    // go to  new task view to add a new to do task
                    newtaskpressed = true
                    
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $newtaskpressed, content: {
                NewItemView( newItemAdded: $newtaskpressed)
            })
        }
    }
}

#Preview {
    ToDoListItemsView(userId: "1uwqT0EEOwNWPZDXpT9yOZVrWsX2")
}
