//
//  TO_do_listApp.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI
import FirebaseCore
@main
struct TO_do_listApp: App {
    init() {
           FirebaseApp.configure()
       }
    var body: some Scene {
        WindowGroup {
            LottieLaunchScreen()
        }
    }
}
