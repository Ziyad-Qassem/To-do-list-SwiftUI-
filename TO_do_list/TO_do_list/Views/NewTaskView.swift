//
//  NewItemView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewTaskViewViewModel()
    @Binding var newItemAdded : Bool
    @State var showALert : Bool = false
    var body: some View {
        VStack {
            // headline
            Text("NewItem")
                .bold()
                .font(.system(size: 30))
                .padding(.top , 50)
            // new task details
            
            Form{
                // new task title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // new task description
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Description" , text: $viewModel.taskDescription)
                
                // new task due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                 
                // confirm new Task
                
                TDLButton(title: "Add Task", buttonColor: .red) {
                    // add task to fire store
            
                    if viewModel.checkInupt() {
                        viewModel.addTask()
                        newItemAdded = false
                    }
                    else {
                       showALert = true
                    }
                }.padding()
                
            }
            .alert(isPresented: $showALert, content: {
                Alert(title: Text("Error") , message: Text(viewModel.errorMessages))
            })
        }
    }
}

#Preview {
    NewItemView(newItemAdded: Binding(get: {
    return true
    }, set: { _ in
        // does nothing
    }))
}
