//
//  TaskDetailView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 07/09/2024.
//

import SwiftUI

struct TaskDetailView: View {
    @State var editingTask : Bool = false
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel : TaskDetailsViewViewModel
    init (taskId : String  ){
        self._viewModel = StateObject(wrappedValue: TaskDetailsViewViewModel(taskId: taskId))
       
    }
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Task Details")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                Spacer()
                
                Button(action: {
                    // edit task details
                    editingTask = !editingTask
                }, label: {
                    Image(systemName: "gear.circle")
                        .font(.system(size: 30))
                }).tint(.black)
            }.padding(.bottom , 30)
                // in editing mode
            if editingTask {
                
                Form {
                    
                    TextField("Task Title ", text: $viewModel.taskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                        .foregroundStyle(.gray)
                    
                    TextField("Task  Description", text: $viewModel.taskDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                        .foregroundStyle(.gray)
                    
                    
                    DatePicker("Due Date", selection: $viewModel.editedTaskDueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                       
                    TDLButton(title: "Save", buttonColor: .red) {
                        // save made edits
                        viewModel.saveChanges()
                        presentationMode.wrappedValue.dismiss() 
                        
                    }
                }
            }
            // in normal mode
            else {
                
                VStack (alignment: .leading){
                    HStack (){
                        Text("Title: ")
                            .font(.system(size: 25))
                          
                        
                        Text(viewModel.toDoTask?.title ?? "Temp Task Title")
                            .font(.system(size: 20))
                        
                    }.padding(.bottom)
                    HStack{
                        Text("Description: ")
                            .font(.system(size: 18))
                            
                        Text(viewModel.toDoTask?.description ?? "Temp Task Description")
                            .font(.system(size: 20))
                        
                    }.padding(.bottom)
                    HStack{
                        Text("Due Date:")
                        Text("\(Date(timeIntervalSince1970: viewModel.toDoTask?.dueDate ?? 0).formatted(date: .abbreviated, time: .shortened))")
                        
                    }.padding(.bottom)
                            
                }
            }
        }
        .onAppear{
            viewModel.FetchTaskDetails()
        }
        .padding(.top , 40)
            .padding()
        Spacer()
    }
}

#Preview {
    TaskDetailView(taskId: "1uwqT0EEOwNWPZDXpT9yOZVrWsX2")
}
