//
//  User.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import Foundation
struct User : Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
