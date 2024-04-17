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
                    //add view
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
