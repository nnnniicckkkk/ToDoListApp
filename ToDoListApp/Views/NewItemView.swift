//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var vm = NewItemViewViewModel()
    @Binding var newItemPresented: Bool 
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form{
                //title
                TextField("Title", text: $vm.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //due
                DatePicker("Due Date", selection: $vm.dueDate)
                    .datePickerStyle(.graphical)
                //button to save
                TLButton(title: "Save", background: .orange) {
                    if vm.canSave {
                        vm.save()
                        newItemPresented = false
                    } else {
                        vm.showAlert = true 
                    }
                }
                .alert(isPresented: $vm.showAlert) {
                    Alert(title: Text("Error"), message: Text("Please fill in all fields and select a due date that is today or newer."))
                }
            }
        }
        .tint(.orange)
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
}
