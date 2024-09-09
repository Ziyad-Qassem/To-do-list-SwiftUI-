//
//  TaskDetailsViewVM.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 07/09/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class TaskDetailsViewViewModel : ObservableObject {
    @Published var taskTitle : String = ""
    @Published var taskDescription : String = ""
    @Published var dueDate : TimeInterval = 0
    @Published var toDoTask : ToDoTask? = nil
    @Published var editedTaskDueDate = Date()
     private var taskId : String
    
    init(taskId : String){
        self.taskId = taskId
    }
    func FetchTaskDetails() {
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(userId).collection("Tasks").document(taskId).getDocument { snapshot, error in
            guard let data = snapshot?.data() , error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.toDoTask = ToDoTask(id: data["id"] as? String ?? "", title: data["title"] as? String ?? "", description: data["description"] as? String ?? "", dueDate: data["dueDate"] as? TimeInterval ?? 0, createDate: data["createDate"] as? TimeInterval ?? 0, isDone: data["isDone"] as? Bool ?? false)
            }
        }
        
        
    }
    func saveChanges() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
       
        let taskCopy = ToDoTask(id: taskId, title: taskTitle, description: taskDescription, dueDate: dueDate, createDate: Date().timeIntervalSince1970, isDone: false)
        
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(userId)
            .collection("Tasks")
            .document(taskId)
            .setData(taskCopy.asDictionary())
        
    }
}
