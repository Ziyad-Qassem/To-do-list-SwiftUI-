//
//  ToDoCellView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct ToDoCellView: View {
    @StateObject var viewModel = ToDoTaskCellViewViewModel()
    let toDoTask : ToDoTask
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(toDoTask.title)
                    .font(.body)
        
                Text("\(Date(timeIntervalSince1970: toDoTask.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
            }
            Spacer()
            
            Button{
                // change task isDone value
                
                viewModel.toggleTaskCheckMark()
            }label: {
                Image(systemName:  toDoTask.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoCellView(toDoTask: ToDoTask(id: "", title: "", description: "", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
}
