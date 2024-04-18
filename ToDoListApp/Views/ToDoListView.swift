//
//  ToDoListItemsView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var vm = ToDoListViewViewModel()
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("To Do")
            .toolbar{
                Button(action: {
                    vm.showingNewItemView = true 
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
        .sheet(isPresented: $vm.showingNewItemView) {
            NewItemView(newItemPresented: $vm.showingNewItemView)
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
