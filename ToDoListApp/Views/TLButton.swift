//
//  TLButton.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(3)
            }
        })
        .padding([.bottom, .top], 5)
        
    }
}

#Preview {
    TLButton(title: "example button", background: .blue){
        //action
    }
}
