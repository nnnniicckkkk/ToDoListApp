//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailText = ""
    @State private var passwordText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
               
                HeaderView(title: "ToDo List", subtitle: "Get stuff done.", angle: 15, background: .pink)
                
                //login
                Form {
                    TextField("Email Address", text: $emailText)
                    
                    SecureField("Password", text: $passwordText)
                    
                    Button(action: {
                        //try logging in
                        
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.blue)
                            
                            Text("Log In")
                                .foregroundStyle(.white)
                                .bold()
                                .padding(3)
                        }
                        
                    })
                    .padding([.bottom, .top], 5)
                    
                    
                }
                .offset(y: -50)
                //register acct
                
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create an Account", destination: RegistrationView())
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
