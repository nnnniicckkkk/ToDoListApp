//
//  ToDoListItemsView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var vm: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._vm = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    
                    ToDoListItemView(item: item)
                        .swipeActions{
                            
                            Button(role: .destructive, action: {
                                vm.delete(id: item.id)
                            }, label: {
                                Image(systemName: "trash")
                                Text("Delete")
                                
                            })
                
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                vm.toggleIsDone(item: item)
                            } label: {
                                Image(systemName: item.isDone ? "xmark" : "checkmark")
                            }
                            .tint(item.isDone ? .blue : .green)
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
