//
//  ToDoListItemsView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var vm = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete", role: .destructive){
                                vm.delete(id: item.id)
                            }

                        }
                }
                .listStyle(.plain)
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
    ToDoListView(userId: "UXAm1K4Of9TmD0kxZ2m82DQu9uq2")
}
