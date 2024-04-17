//
//  RegistrationView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var vm = RegistrationViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing.", angle: -15, background: .orange)
            
            Form {
                Group{
                    TextField("Full Name", text: $vm.name)
                    
                    TextField("Email Address", text: $vm.email)
                        .textInputAutocapitalization(.none)
                        
                }
                .autocorrectionDisabled()
                
                SecureField("Password", text: $vm.password)
                
                TLButton(title: "Register", background: .orange) {
                    vm.register()
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
