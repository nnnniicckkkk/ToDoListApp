//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = "" 
    
    init(){
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        //firebase call that uses the provided info to attempt to login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            //shows an error message if all fields are empty
            errorMessage = "Please fill in all fields before continuing."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            //shows an error message if the email is not valid
            errorMessage = "Please enter a valid email."
            return false
        }
        return true
    }
}
