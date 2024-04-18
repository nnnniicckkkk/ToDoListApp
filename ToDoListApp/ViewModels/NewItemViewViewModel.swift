//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false 
    
    init() {
        
    }
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false 
        }
        return true
    }
}
