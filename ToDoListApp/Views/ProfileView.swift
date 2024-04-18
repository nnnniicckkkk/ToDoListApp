//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var vm = ProfileViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = vm.user {
                    profile(user: user)
                } else {
                    ProgressView("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            vm.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
        }
        .padding()
        
        TLButton(title: "Log Out", background: .red) {
            vm.logOut()
        }
        .frame(maxHeight: 75)
        .padding()
    }
}

#Preview {
    ProfileView()
}
