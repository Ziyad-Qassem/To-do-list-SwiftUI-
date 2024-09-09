//
//  ToDoTaskCellViewVM.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoTaskCellViewViewModel : ObservableObject {
    init () {
        
    }
    func toggleTaskCheckMark(toDoTask : ToDoTask) {
        var taskCopy  = toDoTask
        taskCopy.isTaskDone(!toDoTask.isDone)
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(getUserId())
            .collection("Tasks")
            .document(taskCopy.id)
            .setData(taskCopy.asDictionary())
    }
    private func getUserId() -> String {
        guard let userId = Auth.auth().currentUser?.uid else {
            return ""
        }
        return userId
    }
}
