//
//  NewTaskViewVM.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewTaskViewViewModel : ObservableObject {
    @Published var title : String  = ""
    @Published var dueDate = Date()
    @Published var taskDescription : String = ""
    var errorMessages: String = ""
  
    init () {
        
    }
  
    func addTask() {
       // add task to fire store
        guard checkInupt() else {
            return
        }
        // get user id
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create task instant
        // create a unique id for the task
        let newId = UUID().uuidString
        let newTask = ToDoTask(id: newId, title: title, description: taskDescription, dueDate: dueDate.timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false)
        
        // save task in database
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(userId)
            .collection("Tasks")
            .document(newId)
            .setData(newTask.asDictionary())
        
    }
    func checkInupt () -> Bool {
        // checkinh if title is not empty
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessages = "please enter a title"
            
            return false
        }
        
        // check if the date makes sense
         // this checks that the user has put a date after yesterday which is today or after and 86400 is actually how many seconds in a day
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            errorMessages = "please enter a vaild date"
            
            return false
        }
    
        
        return true
    }
}
