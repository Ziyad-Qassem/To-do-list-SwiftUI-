//
//  ToDoTaskModel.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import Foundation

struct ToDoTask : Codable  , Identifiable {
    let id : String
    let title : String
    let description : String
    let dueDate : TimeInterval
    let createDate : TimeInterval
    var isDone : Bool
    
    mutating func isTaskDone(_ state : Bool) {
        isDone = state
    }
    
}
