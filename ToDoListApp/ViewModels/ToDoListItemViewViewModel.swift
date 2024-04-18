//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


//view model for one single view in the list
//part of the bigger one 
class ToDoListItemViewViewModel: ObservableObject {
    
    init(){
        
    }
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
