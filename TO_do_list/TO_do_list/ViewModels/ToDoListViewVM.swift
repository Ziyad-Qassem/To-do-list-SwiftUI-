//
//  ToDoListViewVM.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import Foundation
import FirebaseFirestore
class ToDoListViewViewModel : ObservableObject {
    private var taskId : String = ""
    private let userId : String
    init(userId : String) {
        self.userId = userId
       
       

        
    }
    
    func setTaskId (taskId : String)  {
        self.taskId = taskId
    }
    func getTaskId () -> String {
        return self.taskId
    }
    func deleteTask(taskId : String) {
        let db = Firestore.firestore()
        db.collection("Users")
            .document(userId)
            .collection("Tasks")
            .document(taskId)
            .delete()
        
    }
    
    
}
