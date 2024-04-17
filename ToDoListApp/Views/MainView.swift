//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewViewModel()
    
    var body: some View {
        if vm.isSignedIn, !vm.currentUserId.isEmpty {
            
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
