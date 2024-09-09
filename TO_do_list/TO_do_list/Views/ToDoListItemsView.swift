//
//  ToDoListItemsView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI
import FirebaseFirestore
struct ToDoListItemsView: View {
    @StateObject var viewModel  : ToDoListViewViewModel
    @State private var taskCellPressed : Bool = false
    @FirestoreQuery var toDoTasks : [ToDoTask]
    @State private var newtaskpressed : Bool = false
    
    
    init (userId : String) {
       
        self._toDoTasks = FirestoreQuery(collectionPath: "Users/\(userId)/Tasks")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
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
                                    
                            }.tint(.red)
                        }
                        .onTapGesture {
                                    // pressed cell to get details
                            taskCellPressed = true
                            viewModel.setTaskId(taskId: item.id)
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
                // open new task view
                NewItemView( newItemAdded: $newtaskpressed)
            }) 
            .sheet(isPresented: $taskCellPressed, content: {
                // open  task details view
                TaskDetailView(taskId: viewModel.getTaskId())
            })
           
        }
    }
}

#Preview {
    ToDoListItemsView(userId: "1uwqT0EEOwNWPZDXpT9yOZVrWsX2")
}
