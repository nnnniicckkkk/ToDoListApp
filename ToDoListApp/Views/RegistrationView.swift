//
//  RegistrationView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing.", angle: -15, background: .orange)
            
            Form {
                Group{
                    TextField("Full Name", text: $name)
                    
                    TextField("Email Address", text: $email)
                        .textInputAutocapitalization(.none)
                        
                }
                .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                
                TLButton(title: "Register", background: .orange) {
                    // attempt registration
                }
            }
            .tint(.orange)
            .offset(y: -50)
            
            
            
            Spacer()
        }
    }
}

#Preview {
    RegistrationView()
}
