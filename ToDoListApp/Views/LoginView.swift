//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var vm = LoginViewViewModel()

    
    var body: some View {
        NavigationStack {
            VStack {
               
                HeaderView(title: "ToDo List", subtitle: "Get stuff done.", angle: 15, background: .pink)
                
               
                Form {
                    if  !vm.errorMessage.isEmpty {
                        Text(vm.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    Group{
                        TextField("Email Address", text: $vm.email)
                        
                        SecureField("Password", text: $vm.password)
                    }
                    .textInputAutocapitalization(.none)
                    
                    TLButton(title: "Log in", background: .pink){
                        vm.login()
                    }
                        
                }
                .tint(.pink)
                .offset(y: -50)
                
                
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create an Account", destination: RegistrationView())
                        .tint(.pink)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
