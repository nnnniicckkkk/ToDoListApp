//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import FirebaseFirestore
import Foundation

//View Model for list of items view
//Main tab
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    
    /// Delete to do list item
    /// - Parameter id: Item ID to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
