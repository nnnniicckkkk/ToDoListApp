//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
